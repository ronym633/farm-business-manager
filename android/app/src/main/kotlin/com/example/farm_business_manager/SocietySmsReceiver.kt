
package com.example.farm_business_manager

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.Telephony
import android.provider.Settings
import org.json.JSONArray
import org.json.JSONObject
import java.util.Locale
import java.util.UUID

object SocietySmsQueue {
    private const val PREFS = "society_sms_queue"
    private const val KEY_MESSAGES = "messages"
    private const val KEY_SENDERS = "allowed_senders"
    private const val MAX_MESSAGES = 500

    private fun normalize(value: String): String =
        value.uppercase(Locale.ROOT).filter { it.isLetterOrDigit() }

    @Synchronized
    fun setAllowedSenders(context: Context, senders: List<String>) {
        val normalized = senders.map { normalize(it) }
            .filter { it.isNotBlank() }
            .toSet()

        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .edit()
            .putStringSet(KEY_SENDERS, normalized)
            .apply()
    }

    @Synchronized
    fun isAllowedSender(context: Context, sender: String): Boolean {
        val allowed = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getStringSet(KEY_SENDERS, emptySet()) ?: emptySet()

        val normalizedSender = normalize(sender)

        return allowed.any { normalizedSender.endsWith(it) }
    }

    @Synchronized
    fun add(context: Context, message: JSONObject) {
        val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        val oldQueue = JSONArray(prefs.getString(KEY_MESSAGES, "[]"))
        val newQueue = JSONArray()

        val start = (oldQueue.length() - MAX_MESSAGES + 1).coerceAtLeast(0)

        for (i in start until oldQueue.length()) {
            newQueue.put(oldQueue.getJSONObject(i))
        }

        newQueue.put(message)
        prefs.edit().putString(KEY_MESSAGES, newQueue.toString()).apply()
    }

    @Synchronized
    fun getAll(context: Context): List<Map<String, Any>> {
        val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        val queue = JSONArray(prefs.getString(KEY_MESSAGES, "[]"))
        val result = mutableListOf<Map<String, Any>>()

        for (i in 0 until queue.length()) {
            val item = queue.getJSONObject(i)
            result.add(
                mapOf(
                    "id" to item.getString("id"),
                    "sender" to item.getString("sender"),
                    "body" to item.getString("body"),
                    "receivedAt" to item.getLong("receivedAt"),
                    "deviceId" to item.getString("deviceId")
                )
            )
        }

        return result
    }

    @Synchronized
    fun remove(context: Context, ids: List<String>) {
        val prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
        val oldQueue = JSONArray(prefs.getString(KEY_MESSAGES, "[]"))
        val newQueue = JSONArray()

        for (i in 0 until oldQueue.length()) {
            val item = oldQueue.getJSONObject(i)
            if (!ids.contains(item.getString("id"))) {
                newQueue.put(item)
            }
        }

        prefs.edit().putString(KEY_MESSAGES, newQueue.toString()).apply()
    }
}

class SocietySmsReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action != Telephony.Sms.Intents.SMS_RECEIVED_ACTION) return

        val messages = Telephony.Sms.Intents.getMessagesFromIntent(intent)
        if (messages.isEmpty()) return

        val sender = messages.firstOrNull()?.originatingAddress ?: return

        // Ignore personal SMS and unregistered society senders.
        if (!SocietySmsQueue.isAllowedSender(context, sender)) return

        val body = messages.joinToString(separator = "") {
            it.messageBody ?: ""
        }

        if (body.isBlank()) return

        val receivedAt = messages.firstOrNull()?.timestampMillis
            ?: System.currentTimeMillis()

        val record = JSONObject().apply {
            put("id", UUID.randomUUID().toString())
            put("sender", sender)
            put("body", body)
            put("receivedAt", receivedAt)
            put(
                "deviceId",
                Settings.Secure.getString(
                    context.contentResolver,
                    Settings.Secure.ANDROID_ID
                ) ?: "unknown"
            )
        }

        SocietySmsQueue.add(context, record)
    }
}
