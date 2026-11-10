// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $BusinessGroupsTable extends BusinessGroups
    with TableInfo<$BusinessGroupsTable, BusinessGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessGroup(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BusinessGroupsTable createAlias(String alias) {
    return $BusinessGroupsTable(attachedDatabase, alias);
  }
}

class BusinessGroup extends DataClass implements Insertable<BusinessGroup> {
  final int id;
  final String name;
  final String? description;
  final DateTime createdAt;
  const BusinessGroup({
    required this.id,
    required this.name,
    this.description,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BusinessGroupsCompanion toCompanion(bool nullToAbsent) {
    return BusinessGroupsCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      createdAt: Value(createdAt),
    );
  }

  factory BusinessGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessGroup(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BusinessGroup copyWith({
    int? id,
    String? name,
    Value<String?> description = const Value.absent(),
    DateTime? createdAt,
  }) => BusinessGroup(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description.present ? description.value : this.description,
    createdAt: createdAt ?? this.createdAt,
  );
  BusinessGroup copyWithCompanion(BusinessGroupsCompanion data) {
    return BusinessGroup(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessGroup(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessGroup &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.createdAt == this.createdAt);
}

class BusinessGroupsCompanion extends UpdateCompanion<BusinessGroup> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<DateTime> createdAt;
  const BusinessGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BusinessGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<BusinessGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BusinessGroupsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? description,
    Value<DateTime>? createdAt,
  }) {
    return BusinessGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BusinessesTable extends Businesses
    with TableInfo<$BusinessesTable, BusinessesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _businessTypeMeta = const VerificationMeta(
    'businessType',
  );
  @override
  late final GeneratedColumn<String> businessType = GeneratedColumn<String>(
    'business_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groupIdMeta = const VerificationMeta(
    'groupId',
  );
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES business_groups (id)',
    ),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    businessType,
    groupId,
    location,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'businesses';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessesData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('business_type')) {
      context.handle(
        _businessTypeMeta,
        businessType.isAcceptableOrUnknown(
          data['business_type']!,
          _businessTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_businessTypeMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIdMeta,
        groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessesData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      businessType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_type'],
      )!,
      groupId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}group_id'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BusinessesTable createAlias(String alias) {
    return $BusinessesTable(attachedDatabase, alias);
  }
}

class BusinessesData extends DataClass implements Insertable<BusinessesData> {
  final int id;
  final String name;
  final String businessType;
  final int? groupId;
  final String? location;
  final bool isActive;
  final DateTime createdAt;
  const BusinessesData({
    required this.id,
    required this.name,
    required this.businessType,
    this.groupId,
    this.location,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['business_type'] = Variable<String>(businessType);
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BusinessesCompanion toCompanion(bool nullToAbsent) {
    return BusinessesCompanion(
      id: Value(id),
      name: Value(name),
      businessType: Value(businessType),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory BusinessesData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessesData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      businessType: serializer.fromJson<String>(json['businessType']),
      groupId: serializer.fromJson<int?>(json['groupId']),
      location: serializer.fromJson<String?>(json['location']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'businessType': serializer.toJson<String>(businessType),
      'groupId': serializer.toJson<int?>(groupId),
      'location': serializer.toJson<String?>(location),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BusinessesData copyWith({
    int? id,
    String? name,
    String? businessType,
    Value<int?> groupId = const Value.absent(),
    Value<String?> location = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => BusinessesData(
    id: id ?? this.id,
    name: name ?? this.name,
    businessType: businessType ?? this.businessType,
    groupId: groupId.present ? groupId.value : this.groupId,
    location: location.present ? location.value : this.location,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  BusinessesData copyWithCompanion(BusinessesCompanion data) {
    return BusinessesData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      businessType: data.businessType.present
          ? data.businessType.value
          : this.businessType,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      location: data.location.present ? data.location.value : this.location,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('groupId: $groupId, ')
          ..write('location: $location, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    businessType,
    groupId,
    location,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessesData &&
          other.id == this.id &&
          other.name == this.name &&
          other.businessType == this.businessType &&
          other.groupId == this.groupId &&
          other.location == this.location &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class BusinessesCompanion extends UpdateCompanion<BusinessesData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> businessType;
  final Value<int?> groupId;
  final Value<String?> location;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const BusinessesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.businessType = const Value.absent(),
    this.groupId = const Value.absent(),
    this.location = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BusinessesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String businessType,
    this.groupId = const Value.absent(),
    this.location = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       businessType = Value(businessType);
  static Insertable<BusinessesData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? businessType,
    Expression<int>? groupId,
    Expression<String>? location,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (businessType != null) 'business_type': businessType,
      if (groupId != null) 'group_id': groupId,
      if (location != null) 'location': location,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BusinessesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? businessType,
    Value<int?>? groupId,
    Value<String?>? location,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return BusinessesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      businessType: businessType ?? this.businessType,
      groupId: groupId ?? this.groupId,
      location: location ?? this.location,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (businessType.present) {
      map['business_type'] = Variable<String>(businessType.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessType: $businessType, ')
          ..write('groupId: $groupId, ')
          ..write('location: $location, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PartnersTable extends Partners with TableInfo<$PartnersTable, Partner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartnersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    email,
    notes,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partners';
  @override
  VerificationContext validateIntegrity(
    Insertable<Partner> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Partner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partner(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PartnersTable createAlias(String alias) {
    return $PartnersTable(attachedDatabase, alias);
  }
}

class Partner extends DataClass implements Insertable<Partner> {
  final int id;
  final String name;
  final String? phone;
  final String? email;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  const Partner({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.notes,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PartnersCompanion toCompanion(bool nullToAbsent) {
    return PartnersCompanion(
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory Partner.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partner(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Partner copyWith({
    int? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => Partner(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    email: email.present ? email.value : this.email,
    notes: notes.present ? notes.value : this.notes,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  Partner copyWithCompanion(PartnersCompanion data) {
    return Partner(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partner(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, phone, email, notes, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partner &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class PartnersCompanion extends UpdateCompanion<Partner> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const PartnersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PartnersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Partner> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PartnersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<String?>? email,
    Value<String?>? notes,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return PartnersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartnersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $BusinessPartnersTable extends BusinessPartners
    with TableInfo<$BusinessPartnersTable, BusinessPartner> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessPartnersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<int> businessId = GeneratedColumn<int>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES businesses (id)',
    ),
  );
  static const VerificationMeta _partnerIdMeta = const VerificationMeta(
    'partnerId',
  );
  @override
  late final GeneratedColumn<int> partnerId = GeneratedColumn<int>(
    'partner_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partners (id)',
    ),
  );
  static const VerificationMeta _sharePercentageMeta = const VerificationMeta(
    'sharePercentage',
  );
  @override
  late final GeneratedColumn<double> sharePercentage = GeneratedColumn<double>(
    'share_percentage',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessId,
    partnerId,
    sharePercentage,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_partners';
  @override
  VerificationContext validateIntegrity(
    Insertable<BusinessPartner> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('partner_id')) {
      context.handle(
        _partnerIdMeta,
        partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_partnerIdMeta);
    }
    if (data.containsKey('share_percentage')) {
      context.handle(
        _sharePercentageMeta,
        sharePercentage.isAcceptableOrUnknown(
          data['share_percentage']!,
          _sharePercentageMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sharePercentageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessPartner map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessPartner(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}business_id'],
      )!,
      partnerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partner_id'],
      )!,
      sharePercentage: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}share_percentage'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $BusinessPartnersTable createAlias(String alias) {
    return $BusinessPartnersTable(attachedDatabase, alias);
  }
}

class BusinessPartner extends DataClass implements Insertable<BusinessPartner> {
  final int id;
  final int businessId;
  final int partnerId;
  final double sharePercentage;
  final DateTime createdAt;
  const BusinessPartner({
    required this.id,
    required this.businessId,
    required this.partnerId,
    required this.sharePercentage,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_id'] = Variable<int>(businessId);
    map['partner_id'] = Variable<int>(partnerId);
    map['share_percentage'] = Variable<double>(sharePercentage);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  BusinessPartnersCompanion toCompanion(bool nullToAbsent) {
    return BusinessPartnersCompanion(
      id: Value(id),
      businessId: Value(businessId),
      partnerId: Value(partnerId),
      sharePercentage: Value(sharePercentage),
      createdAt: Value(createdAt),
    );
  }

  factory BusinessPartner.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessPartner(
      id: serializer.fromJson<int>(json['id']),
      businessId: serializer.fromJson<int>(json['businessId']),
      partnerId: serializer.fromJson<int>(json['partnerId']),
      sharePercentage: serializer.fromJson<double>(json['sharePercentage']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessId': serializer.toJson<int>(businessId),
      'partnerId': serializer.toJson<int>(partnerId),
      'sharePercentage': serializer.toJson<double>(sharePercentage),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  BusinessPartner copyWith({
    int? id,
    int? businessId,
    int? partnerId,
    double? sharePercentage,
    DateTime? createdAt,
  }) => BusinessPartner(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    partnerId: partnerId ?? this.partnerId,
    sharePercentage: sharePercentage ?? this.sharePercentage,
    createdAt: createdAt ?? this.createdAt,
  );
  BusinessPartner copyWithCompanion(BusinessPartnersCompanion data) {
    return BusinessPartner(
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      partnerId: data.partnerId.present ? data.partnerId.value : this.partnerId,
      sharePercentage: data.sharePercentage.present
          ? data.sharePercentage.value
          : this.sharePercentage,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessPartner(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('partnerId: $partnerId, ')
          ..write('sharePercentage: $sharePercentage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, businessId, partnerId, sharePercentage, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessPartner &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.partnerId == this.partnerId &&
          other.sharePercentage == this.sharePercentage &&
          other.createdAt == this.createdAt);
}

class BusinessPartnersCompanion extends UpdateCompanion<BusinessPartner> {
  final Value<int> id;
  final Value<int> businessId;
  final Value<int> partnerId;
  final Value<double> sharePercentage;
  final Value<DateTime> createdAt;
  const BusinessPartnersCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.partnerId = const Value.absent(),
    this.sharePercentage = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  BusinessPartnersCompanion.insert({
    this.id = const Value.absent(),
    required int businessId,
    required int partnerId,
    required double sharePercentage,
    this.createdAt = const Value.absent(),
  }) : businessId = Value(businessId),
       partnerId = Value(partnerId),
       sharePercentage = Value(sharePercentage);
  static Insertable<BusinessPartner> custom({
    Expression<int>? id,
    Expression<int>? businessId,
    Expression<int>? partnerId,
    Expression<double>? sharePercentage,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (partnerId != null) 'partner_id': partnerId,
      if (sharePercentage != null) 'share_percentage': sharePercentage,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  BusinessPartnersCompanion copyWith({
    Value<int>? id,
    Value<int>? businessId,
    Value<int>? partnerId,
    Value<double>? sharePercentage,
    Value<DateTime>? createdAt,
  }) {
    return BusinessPartnersCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      partnerId: partnerId ?? this.partnerId,
      sharePercentage: sharePercentage ?? this.sharePercentage,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<int>(businessId.value);
    }
    if (partnerId.present) {
      map['partner_id'] = Variable<int>(partnerId.value);
    }
    if (sharePercentage.present) {
      map['share_percentage'] = Variable<double>(sharePercentage.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessPartnersCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('partnerId: $partnerId, ')
          ..write('sharePercentage: $sharePercentage, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FinancialTransactionsTable extends FinancialTransactions
    with TableInfo<$FinancialTransactionsTable, FinancialTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FinancialTransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<int> businessId = GeneratedColumn<int>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES businesses (id)',
    ),
  );
  static const VerificationMeta _transactionTypeMeta = const VerificationMeta(
    'transactionType',
  );
  @override
  late final GeneratedColumn<String> transactionType = GeneratedColumn<String>(
    'transaction_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>(
        'transaction_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isReversedMeta = const VerificationMeta(
    'isReversed',
  );
  @override
  late final GeneratedColumn<bool> isReversed = GeneratedColumn<bool>(
    'is_reversed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_reversed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reversedAtMeta = const VerificationMeta(
    'reversedAt',
  );
  @override
  late final GeneratedColumn<DateTime> reversedAt = GeneratedColumn<DateTime>(
    'reversed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reversalReasonMeta = const VerificationMeta(
    'reversalReason',
  );
  @override
  late final GeneratedColumn<String> reversalReason = GeneratedColumn<String>(
    'reversal_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessId,
    transactionType,
    category,
    amount,
    transactionDate,
    description,
    isReversed,
    reversedAt,
    reversalReason,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'financial_transactions';
  @override
  VerificationContext validateIntegrity(
    Insertable<FinancialTransaction> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('transaction_type')) {
      context.handle(
        _transactionTypeMeta,
        transactionType.isAcceptableOrUnknown(
          data['transaction_type']!,
          _transactionTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionTypeMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('is_reversed')) {
      context.handle(
        _isReversedMeta,
        isReversed.isAcceptableOrUnknown(data['is_reversed']!, _isReversedMeta),
      );
    }
    if (data.containsKey('reversed_at')) {
      context.handle(
        _reversedAtMeta,
        reversedAt.isAcceptableOrUnknown(data['reversed_at']!, _reversedAtMeta),
      );
    }
    if (data.containsKey('reversal_reason')) {
      context.handle(
        _reversalReasonMeta,
        reversalReason.isAcceptableOrUnknown(
          data['reversal_reason']!,
          _reversalReasonMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FinancialTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FinancialTransaction(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}business_id'],
      )!,
      transactionType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transaction_type'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transaction_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      isReversed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_reversed'],
      )!,
      reversedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}reversed_at'],
      ),
      reversalReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reversal_reason'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $FinancialTransactionsTable createAlias(String alias) {
    return $FinancialTransactionsTable(attachedDatabase, alias);
  }
}

class FinancialTransaction extends DataClass
    implements Insertable<FinancialTransaction> {
  final int id;
  final int businessId;
  final String transactionType;
  final String category;
  final double amount;
  final DateTime transactionDate;
  final String? description;
  final bool isReversed;
  final DateTime? reversedAt;
  final String? reversalReason;
  final DateTime createdAt;
  const FinancialTransaction({
    required this.id,
    required this.businessId,
    required this.transactionType,
    required this.category,
    required this.amount,
    required this.transactionDate,
    this.description,
    required this.isReversed,
    this.reversedAt,
    this.reversalReason,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_id'] = Variable<int>(businessId);
    map['transaction_type'] = Variable<String>(transactionType);
    map['category'] = Variable<String>(category);
    map['amount'] = Variable<double>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_reversed'] = Variable<bool>(isReversed);
    if (!nullToAbsent || reversedAt != null) {
      map['reversed_at'] = Variable<DateTime>(reversedAt);
    }
    if (!nullToAbsent || reversalReason != null) {
      map['reversal_reason'] = Variable<String>(reversalReason);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FinancialTransactionsCompanion toCompanion(bool nullToAbsent) {
    return FinancialTransactionsCompanion(
      id: Value(id),
      businessId: Value(businessId),
      transactionType: Value(transactionType),
      category: Value(category),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isReversed: Value(isReversed),
      reversedAt: reversedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(reversedAt),
      reversalReason: reversalReason == null && nullToAbsent
          ? const Value.absent()
          : Value(reversalReason),
      createdAt: Value(createdAt),
    );
  }

  factory FinancialTransaction.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FinancialTransaction(
      id: serializer.fromJson<int>(json['id']),
      businessId: serializer.fromJson<int>(json['businessId']),
      transactionType: serializer.fromJson<String>(json['transactionType']),
      category: serializer.fromJson<String>(json['category']),
      amount: serializer.fromJson<double>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      description: serializer.fromJson<String?>(json['description']),
      isReversed: serializer.fromJson<bool>(json['isReversed']),
      reversedAt: serializer.fromJson<DateTime?>(json['reversedAt']),
      reversalReason: serializer.fromJson<String?>(json['reversalReason']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessId': serializer.toJson<int>(businessId),
      'transactionType': serializer.toJson<String>(transactionType),
      'category': serializer.toJson<String>(category),
      'amount': serializer.toJson<double>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'description': serializer.toJson<String?>(description),
      'isReversed': serializer.toJson<bool>(isReversed),
      'reversedAt': serializer.toJson<DateTime?>(reversedAt),
      'reversalReason': serializer.toJson<String?>(reversalReason),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  FinancialTransaction copyWith({
    int? id,
    int? businessId,
    String? transactionType,
    String? category,
    double? amount,
    DateTime? transactionDate,
    Value<String?> description = const Value.absent(),
    bool? isReversed,
    Value<DateTime?> reversedAt = const Value.absent(),
    Value<String?> reversalReason = const Value.absent(),
    DateTime? createdAt,
  }) => FinancialTransaction(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    transactionType: transactionType ?? this.transactionType,
    category: category ?? this.category,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    description: description.present ? description.value : this.description,
    isReversed: isReversed ?? this.isReversed,
    reversedAt: reversedAt.present ? reversedAt.value : this.reversedAt,
    reversalReason: reversalReason.present
        ? reversalReason.value
        : this.reversalReason,
    createdAt: createdAt ?? this.createdAt,
  );
  FinancialTransaction copyWithCompanion(FinancialTransactionsCompanion data) {
    return FinancialTransaction(
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      transactionType: data.transactionType.present
          ? data.transactionType.value
          : this.transactionType,
      category: data.category.present ? data.category.value : this.category,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      isReversed: data.isReversed.present
          ? data.isReversed.value
          : this.isReversed,
      reversedAt: data.reversedAt.present
          ? data.reversedAt.value
          : this.reversedAt,
      reversalReason: data.reversalReason.present
          ? data.reversalReason.value
          : this.reversalReason,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FinancialTransaction(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('transactionType: $transactionType, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('description: $description, ')
          ..write('isReversed: $isReversed, ')
          ..write('reversedAt: $reversedAt, ')
          ..write('reversalReason: $reversalReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    businessId,
    transactionType,
    category,
    amount,
    transactionDate,
    description,
    isReversed,
    reversedAt,
    reversalReason,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FinancialTransaction &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.transactionType == this.transactionType &&
          other.category == this.category &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.description == this.description &&
          other.isReversed == this.isReversed &&
          other.reversedAt == this.reversedAt &&
          other.reversalReason == this.reversalReason &&
          other.createdAt == this.createdAt);
}

class FinancialTransactionsCompanion
    extends UpdateCompanion<FinancialTransaction> {
  final Value<int> id;
  final Value<int> businessId;
  final Value<String> transactionType;
  final Value<String> category;
  final Value<double> amount;
  final Value<DateTime> transactionDate;
  final Value<String?> description;
  final Value<bool> isReversed;
  final Value<DateTime?> reversedAt;
  final Value<String?> reversalReason;
  final Value<DateTime> createdAt;
  const FinancialTransactionsCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.transactionType = const Value.absent(),
    this.category = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.description = const Value.absent(),
    this.isReversed = const Value.absent(),
    this.reversedAt = const Value.absent(),
    this.reversalReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FinancialTransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int businessId,
    required String transactionType,
    required String category,
    required double amount,
    required DateTime transactionDate,
    this.description = const Value.absent(),
    this.isReversed = const Value.absent(),
    this.reversedAt = const Value.absent(),
    this.reversalReason = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : businessId = Value(businessId),
       transactionType = Value(transactionType),
       category = Value(category),
       amount = Value(amount),
       transactionDate = Value(transactionDate);
  static Insertable<FinancialTransaction> custom({
    Expression<int>? id,
    Expression<int>? businessId,
    Expression<String>? transactionType,
    Expression<String>? category,
    Expression<double>? amount,
    Expression<DateTime>? transactionDate,
    Expression<String>? description,
    Expression<bool>? isReversed,
    Expression<DateTime>? reversedAt,
    Expression<String>? reversalReason,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (transactionType != null) 'transaction_type': transactionType,
      if (category != null) 'category': category,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (description != null) 'description': description,
      if (isReversed != null) 'is_reversed': isReversed,
      if (reversedAt != null) 'reversed_at': reversedAt,
      if (reversalReason != null) 'reversal_reason': reversalReason,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FinancialTransactionsCompanion copyWith({
    Value<int>? id,
    Value<int>? businessId,
    Value<String>? transactionType,
    Value<String>? category,
    Value<double>? amount,
    Value<DateTime>? transactionDate,
    Value<String?>? description,
    Value<bool>? isReversed,
    Value<DateTime?>? reversedAt,
    Value<String?>? reversalReason,
    Value<DateTime>? createdAt,
  }) {
    return FinancialTransactionsCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      transactionType: transactionType ?? this.transactionType,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      description: description ?? this.description,
      isReversed: isReversed ?? this.isReversed,
      reversedAt: reversedAt ?? this.reversedAt,
      reversalReason: reversalReason ?? this.reversalReason,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<int>(businessId.value);
    }
    if (transactionType.present) {
      map['transaction_type'] = Variable<String>(transactionType.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isReversed.present) {
      map['is_reversed'] = Variable<bool>(isReversed.value);
    }
    if (reversedAt.present) {
      map['reversed_at'] = Variable<DateTime>(reversedAt.value);
    }
    if (reversalReason.present) {
      map['reversal_reason'] = Variable<String>(reversalReason.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FinancialTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('transactionType: $transactionType, ')
          ..write('category: $category, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('description: $description, ')
          ..write('isReversed: $isReversed, ')
          ..write('reversedAt: $reversedAt, ')
          ..write('reversalReason: $reversalReason, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TransactionAuditLogsTable extends TransactionAuditLogs
    with TableInfo<$TransactionAuditLogsTable, TransactionAuditLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionAuditLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transactionIdMeta = const VerificationMeta(
    'transactionId',
  );
  @override
  late final GeneratedColumn<int> transactionId = GeneratedColumn<int>(
    'transaction_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
    'action',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _detailsMeta = const VerificationMeta(
    'details',
  );
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
    'details',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transactionId,
    action,
    details,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_audit_logs';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransactionAuditLog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaction_id')) {
      context.handle(
        _transactionIdMeta,
        transactionId.isAcceptableOrUnknown(
          data['transaction_id']!,
          _transactionIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionIdMeta);
    }
    if (data.containsKey('action')) {
      context.handle(
        _actionMeta,
        action.isAcceptableOrUnknown(data['action']!, _actionMeta),
      );
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('details')) {
      context.handle(
        _detailsMeta,
        details.isAcceptableOrUnknown(data['details']!, _detailsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionAuditLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionAuditLog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaction_id'],
      )!,
      action: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action'],
      )!,
      details: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}details'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TransactionAuditLogsTable createAlias(String alias) {
    return $TransactionAuditLogsTable(attachedDatabase, alias);
  }
}

class TransactionAuditLog extends DataClass
    implements Insertable<TransactionAuditLog> {
  final int id;
  final int transactionId;
  final String action;
  final String? details;
  final DateTime createdAt;
  const TransactionAuditLog({
    required this.id,
    required this.transactionId,
    required this.action,
    this.details,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaction_id'] = Variable<int>(transactionId);
    map['action'] = Variable<String>(action);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransactionAuditLogsCompanion toCompanion(bool nullToAbsent) {
    return TransactionAuditLogsCompanion(
      id: Value(id),
      transactionId: Value(transactionId),
      action: Value(action),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      createdAt: Value(createdAt),
    );
  }

  factory TransactionAuditLog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionAuditLog(
      id: serializer.fromJson<int>(json['id']),
      transactionId: serializer.fromJson<int>(json['transactionId']),
      action: serializer.fromJson<String>(json['action']),
      details: serializer.fromJson<String?>(json['details']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transactionId': serializer.toJson<int>(transactionId),
      'action': serializer.toJson<String>(action),
      'details': serializer.toJson<String?>(details),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransactionAuditLog copyWith({
    int? id,
    int? transactionId,
    String? action,
    Value<String?> details = const Value.absent(),
    DateTime? createdAt,
  }) => TransactionAuditLog(
    id: id ?? this.id,
    transactionId: transactionId ?? this.transactionId,
    action: action ?? this.action,
    details: details.present ? details.value : this.details,
    createdAt: createdAt ?? this.createdAt,
  );
  TransactionAuditLog copyWithCompanion(TransactionAuditLogsCompanion data) {
    return TransactionAuditLog(
      id: data.id.present ? data.id.value : this.id,
      transactionId: data.transactionId.present
          ? data.transactionId.value
          : this.transactionId,
      action: data.action.present ? data.action.value : this.action,
      details: data.details.present ? data.details.value : this.details,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAuditLog(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('action: $action, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, transactionId, action, details, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionAuditLog &&
          other.id == this.id &&
          other.transactionId == this.transactionId &&
          other.action == this.action &&
          other.details == this.details &&
          other.createdAt == this.createdAt);
}

class TransactionAuditLogsCompanion
    extends UpdateCompanion<TransactionAuditLog> {
  final Value<int> id;
  final Value<int> transactionId;
  final Value<String> action;
  final Value<String?> details;
  final Value<DateTime> createdAt;
  const TransactionAuditLogsCompanion({
    this.id = const Value.absent(),
    this.transactionId = const Value.absent(),
    this.action = const Value.absent(),
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransactionAuditLogsCompanion.insert({
    this.id = const Value.absent(),
    required int transactionId,
    required String action,
    this.details = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : transactionId = Value(transactionId),
       action = Value(action);
  static Insertable<TransactionAuditLog> custom({
    Expression<int>? id,
    Expression<int>? transactionId,
    Expression<String>? action,
    Expression<String>? details,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transactionId != null) 'transaction_id': transactionId,
      if (action != null) 'action': action,
      if (details != null) 'details': details,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransactionAuditLogsCompanion copyWith({
    Value<int>? id,
    Value<int>? transactionId,
    Value<String>? action,
    Value<String?>? details,
    Value<DateTime>? createdAt,
  }) {
    return TransactionAuditLogsCompanion(
      id: id ?? this.id,
      transactionId: transactionId ?? this.transactionId,
      action: action ?? this.action,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transactionId.present) {
      map['transaction_id'] = Variable<int>(transactionId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionAuditLogsCompanion(')
          ..write('id: $id, ')
          ..write('transactionId: $transactionId, ')
          ..write('action: $action, ')
          ..write('details: $details, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MilkSocietiesTable extends MilkSocieties
    with TableInfo<$MilkSocietiesTable, MilkSociety> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilkSocietiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _businessIdMeta = const VerificationMeta(
    'businessId',
  );
  @override
  late final GeneratedColumn<int> businessId = GeneratedColumn<int>(
    'business_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES businesses (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    businessId,
    name,
    location,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'milk_societies';
  @override
  VerificationContext validateIntegrity(
    Insertable<MilkSociety> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('business_id')) {
      context.handle(
        _businessIdMeta,
        businessId.isAcceptableOrUnknown(data['business_id']!, _businessIdMeta),
      );
    } else if (isInserting) {
      context.missing(_businessIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MilkSociety map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MilkSociety(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      businessId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}business_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MilkSocietiesTable createAlias(String alias) {
    return $MilkSocietiesTable(attachedDatabase, alias);
  }
}

class MilkSociety extends DataClass implements Insertable<MilkSociety> {
  final int id;
  final int businessId;
  final String name;
  final String? location;
  final bool isActive;
  final DateTime createdAt;
  const MilkSociety({
    required this.id,
    required this.businessId,
    required this.name,
    this.location,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['business_id'] = Variable<int>(businessId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MilkSocietiesCompanion toCompanion(bool nullToAbsent) {
    return MilkSocietiesCompanion(
      id: Value(id),
      businessId: Value(businessId),
      name: Value(name),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory MilkSociety.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MilkSociety(
      id: serializer.fromJson<int>(json['id']),
      businessId: serializer.fromJson<int>(json['businessId']),
      name: serializer.fromJson<String>(json['name']),
      location: serializer.fromJson<String?>(json['location']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'businessId': serializer.toJson<int>(businessId),
      'name': serializer.toJson<String>(name),
      'location': serializer.toJson<String?>(location),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MilkSociety copyWith({
    int? id,
    int? businessId,
    String? name,
    Value<String?> location = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => MilkSociety(
    id: id ?? this.id,
    businessId: businessId ?? this.businessId,
    name: name ?? this.name,
    location: location.present ? location.value : this.location,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  MilkSociety copyWithCompanion(MilkSocietiesCompanion data) {
    return MilkSociety(
      id: data.id.present ? data.id.value : this.id,
      businessId: data.businessId.present
          ? data.businessId.value
          : this.businessId,
      name: data.name.present ? data.name.value : this.name,
      location: data.location.present ? data.location.value : this.location,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MilkSociety(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, businessId, name, location, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MilkSociety &&
          other.id == this.id &&
          other.businessId == this.businessId &&
          other.name == this.name &&
          other.location == this.location &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class MilkSocietiesCompanion extends UpdateCompanion<MilkSociety> {
  final Value<int> id;
  final Value<int> businessId;
  final Value<String> name;
  final Value<String?> location;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const MilkSocietiesCompanion({
    this.id = const Value.absent(),
    this.businessId = const Value.absent(),
    this.name = const Value.absent(),
    this.location = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MilkSocietiesCompanion.insert({
    this.id = const Value.absent(),
    required int businessId,
    required String name,
    this.location = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : businessId = Value(businessId),
       name = Value(name);
  static Insertable<MilkSociety> custom({
    Expression<int>? id,
    Expression<int>? businessId,
    Expression<String>? name,
    Expression<String>? location,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (businessId != null) 'business_id': businessId,
      if (name != null) 'name': name,
      if (location != null) 'location': location,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MilkSocietiesCompanion copyWith({
    Value<int>? id,
    Value<int>? businessId,
    Value<String>? name,
    Value<String?>? location,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return MilkSocietiesCompanion(
      id: id ?? this.id,
      businessId: businessId ?? this.businessId,
      name: name ?? this.name,
      location: location ?? this.location,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (businessId.present) {
      map['business_id'] = Variable<int>(businessId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilkSocietiesCompanion(')
          ..write('id: $id, ')
          ..write('businessId: $businessId, ')
          ..write('name: $name, ')
          ..write('location: $location, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SocietySendersTable extends SocietySenders
    with TableInfo<$SocietySendersTable, SocietySender> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SocietySendersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _societyIdMeta = const VerificationMeta(
    'societyId',
  );
  @override
  late final GeneratedColumn<int> societyId = GeneratedColumn<int>(
    'society_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milk_societies (id)',
    ),
  );
  static const VerificationMeta _senderIdentifierMeta = const VerificationMeta(
    'senderIdentifier',
  );
  @override
  late final GeneratedColumn<String> senderIdentifier = GeneratedColumn<String>(
    'sender_identifier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    societyId,
    senderIdentifier,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'society_senders';
  @override
  VerificationContext validateIntegrity(
    Insertable<SocietySender> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('society_id')) {
      context.handle(
        _societyIdMeta,
        societyId.isAcceptableOrUnknown(data['society_id']!, _societyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_societyIdMeta);
    }
    if (data.containsKey('sender_identifier')) {
      context.handle(
        _senderIdentifierMeta,
        senderIdentifier.isAcceptableOrUnknown(
          data['sender_identifier']!,
          _senderIdentifierMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_senderIdentifierMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SocietySender map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SocietySender(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      societyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}society_id'],
      )!,
      senderIdentifier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender_identifier'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SocietySendersTable createAlias(String alias) {
    return $SocietySendersTable(attachedDatabase, alias);
  }
}

class SocietySender extends DataClass implements Insertable<SocietySender> {
  final int id;
  final int societyId;
  final String senderIdentifier;
  final bool isActive;
  final DateTime createdAt;
  const SocietySender({
    required this.id,
    required this.societyId,
    required this.senderIdentifier,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['society_id'] = Variable<int>(societyId);
    map['sender_identifier'] = Variable<String>(senderIdentifier);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SocietySendersCompanion toCompanion(bool nullToAbsent) {
    return SocietySendersCompanion(
      id: Value(id),
      societyId: Value(societyId),
      senderIdentifier: Value(senderIdentifier),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory SocietySender.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SocietySender(
      id: serializer.fromJson<int>(json['id']),
      societyId: serializer.fromJson<int>(json['societyId']),
      senderIdentifier: serializer.fromJson<String>(json['senderIdentifier']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'societyId': serializer.toJson<int>(societyId),
      'senderIdentifier': serializer.toJson<String>(senderIdentifier),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SocietySender copyWith({
    int? id,
    int? societyId,
    String? senderIdentifier,
    bool? isActive,
    DateTime? createdAt,
  }) => SocietySender(
    id: id ?? this.id,
    societyId: societyId ?? this.societyId,
    senderIdentifier: senderIdentifier ?? this.senderIdentifier,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  SocietySender copyWithCompanion(SocietySendersCompanion data) {
    return SocietySender(
      id: data.id.present ? data.id.value : this.id,
      societyId: data.societyId.present ? data.societyId.value : this.societyId,
      senderIdentifier: data.senderIdentifier.present
          ? data.senderIdentifier.value
          : this.senderIdentifier,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SocietySender(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('senderIdentifier: $senderIdentifier, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, societyId, senderIdentifier, isActive, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocietySender &&
          other.id == this.id &&
          other.societyId == this.societyId &&
          other.senderIdentifier == this.senderIdentifier &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class SocietySendersCompanion extends UpdateCompanion<SocietySender> {
  final Value<int> id;
  final Value<int> societyId;
  final Value<String> senderIdentifier;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const SocietySendersCompanion({
    this.id = const Value.absent(),
    this.societyId = const Value.absent(),
    this.senderIdentifier = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SocietySendersCompanion.insert({
    this.id = const Value.absent(),
    required int societyId,
    required String senderIdentifier,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : societyId = Value(societyId),
       senderIdentifier = Value(senderIdentifier);
  static Insertable<SocietySender> custom({
    Expression<int>? id,
    Expression<int>? societyId,
    Expression<String>? senderIdentifier,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (societyId != null) 'society_id': societyId,
      if (senderIdentifier != null) 'sender_identifier': senderIdentifier,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SocietySendersCompanion copyWith({
    Value<int>? id,
    Value<int>? societyId,
    Value<String>? senderIdentifier,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return SocietySendersCompanion(
      id: id ?? this.id,
      societyId: societyId ?? this.societyId,
      senderIdentifier: senderIdentifier ?? this.senderIdentifier,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (societyId.present) {
      map['society_id'] = Variable<int>(societyId.value);
    }
    if (senderIdentifier.present) {
      map['sender_identifier'] = Variable<String>(senderIdentifier.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SocietySendersCompanion(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('senderIdentifier: $senderIdentifier, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $MilkProducersTable extends MilkProducers
    with TableInfo<$MilkProducersTable, MilkProducer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MilkProducersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _societyIdMeta = const VerificationMeta(
    'societyId',
  );
  @override
  late final GeneratedColumn<int> societyId = GeneratedColumn<int>(
    'society_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milk_societies (id)',
    ),
  );
  static const VerificationMeta _producerNumberMeta = const VerificationMeta(
    'producerNumber',
  );
  @override
  late final GeneratedColumn<String> producerNumber = GeneratedColumn<String>(
    'producer_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _producerNameMeta = const VerificationMeta(
    'producerName',
  );
  @override
  late final GeneratedColumn<String> producerName = GeneratedColumn<String>(
    'producer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    societyId,
    producerNumber,
    producerName,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'milk_producers';
  @override
  VerificationContext validateIntegrity(
    Insertable<MilkProducer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('society_id')) {
      context.handle(
        _societyIdMeta,
        societyId.isAcceptableOrUnknown(data['society_id']!, _societyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_societyIdMeta);
    }
    if (data.containsKey('producer_number')) {
      context.handle(
        _producerNumberMeta,
        producerNumber.isAcceptableOrUnknown(
          data['producer_number']!,
          _producerNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_producerNumberMeta);
    }
    if (data.containsKey('producer_name')) {
      context.handle(
        _producerNameMeta,
        producerName.isAcceptableOrUnknown(
          data['producer_name']!,
          _producerNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_producerNameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MilkProducer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MilkProducer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      societyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}society_id'],
      )!,
      producerNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producer_number'],
      )!,
      producerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producer_name'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $MilkProducersTable createAlias(String alias) {
    return $MilkProducersTable(attachedDatabase, alias);
  }
}

class MilkProducer extends DataClass implements Insertable<MilkProducer> {
  final int id;
  final int societyId;
  final String producerNumber;
  final String producerName;
  final bool isActive;
  final DateTime createdAt;
  const MilkProducer({
    required this.id,
    required this.societyId,
    required this.producerNumber,
    required this.producerName,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['society_id'] = Variable<int>(societyId);
    map['producer_number'] = Variable<String>(producerNumber);
    map['producer_name'] = Variable<String>(producerName);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  MilkProducersCompanion toCompanion(bool nullToAbsent) {
    return MilkProducersCompanion(
      id: Value(id),
      societyId: Value(societyId),
      producerNumber: Value(producerNumber),
      producerName: Value(producerName),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory MilkProducer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MilkProducer(
      id: serializer.fromJson<int>(json['id']),
      societyId: serializer.fromJson<int>(json['societyId']),
      producerNumber: serializer.fromJson<String>(json['producerNumber']),
      producerName: serializer.fromJson<String>(json['producerName']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'societyId': serializer.toJson<int>(societyId),
      'producerNumber': serializer.toJson<String>(producerNumber),
      'producerName': serializer.toJson<String>(producerName),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  MilkProducer copyWith({
    int? id,
    int? societyId,
    String? producerNumber,
    String? producerName,
    bool? isActive,
    DateTime? createdAt,
  }) => MilkProducer(
    id: id ?? this.id,
    societyId: societyId ?? this.societyId,
    producerNumber: producerNumber ?? this.producerNumber,
    producerName: producerName ?? this.producerName,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  MilkProducer copyWithCompanion(MilkProducersCompanion data) {
    return MilkProducer(
      id: data.id.present ? data.id.value : this.id,
      societyId: data.societyId.present ? data.societyId.value : this.societyId,
      producerNumber: data.producerNumber.present
          ? data.producerNumber.value
          : this.producerNumber,
      producerName: data.producerName.present
          ? data.producerName.value
          : this.producerName,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MilkProducer(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('producerNumber: $producerNumber, ')
          ..write('producerName: $producerName, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    societyId,
    producerNumber,
    producerName,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MilkProducer &&
          other.id == this.id &&
          other.societyId == this.societyId &&
          other.producerNumber == this.producerNumber &&
          other.producerName == this.producerName &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class MilkProducersCompanion extends UpdateCompanion<MilkProducer> {
  final Value<int> id;
  final Value<int> societyId;
  final Value<String> producerNumber;
  final Value<String> producerName;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const MilkProducersCompanion({
    this.id = const Value.absent(),
    this.societyId = const Value.absent(),
    this.producerNumber = const Value.absent(),
    this.producerName = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  MilkProducersCompanion.insert({
    this.id = const Value.absent(),
    required int societyId,
    required String producerNumber,
    required String producerName,
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : societyId = Value(societyId),
       producerNumber = Value(producerNumber),
       producerName = Value(producerName);
  static Insertable<MilkProducer> custom({
    Expression<int>? id,
    Expression<int>? societyId,
    Expression<String>? producerNumber,
    Expression<String>? producerName,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (societyId != null) 'society_id': societyId,
      if (producerNumber != null) 'producer_number': producerNumber,
      if (producerName != null) 'producer_name': producerName,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  MilkProducersCompanion copyWith({
    Value<int>? id,
    Value<int>? societyId,
    Value<String>? producerNumber,
    Value<String>? producerName,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return MilkProducersCompanion(
      id: id ?? this.id,
      societyId: societyId ?? this.societyId,
      producerNumber: producerNumber ?? this.producerNumber,
      producerName: producerName ?? this.producerName,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (societyId.present) {
      map['society_id'] = Variable<int>(societyId.value);
    }
    if (producerNumber.present) {
      map['producer_number'] = Variable<String>(producerNumber.value);
    }
    if (producerName.present) {
      map['producer_name'] = Variable<String>(producerName.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MilkProducersCompanion(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('producerNumber: $producerNumber, ')
          ..write('producerName: $producerName, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RegisteredDevicesTable extends RegisteredDevices
    with TableInfo<$RegisteredDevicesTable, RegisteredDevice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RegisteredDevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _deviceIdMeta = const VerificationMeta(
    'deviceId',
  );
  @override
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
    'device_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _partnerIdMeta = const VerificationMeta(
    'partnerId',
  );
  @override
  late final GeneratedColumn<int> partnerId = GeneratedColumn<int>(
    'partner_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partners (id)',
    ),
  );
  static const VerificationMeta _deviceNameMeta = const VerificationMeta(
    'deviceName',
  );
  @override
  late final GeneratedColumn<String> deviceName = GeneratedColumn<String>(
    'device_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _platformMeta = const VerificationMeta(
    'platform',
  );
  @override
  late final GeneratedColumn<String> platform = GeneratedColumn<String>(
    'platform',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSeenAtMeta = const VerificationMeta(
    'lastSeenAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSeenAt = GeneratedColumn<DateTime>(
    'last_seen_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    deviceId,
    partnerId,
    deviceName,
    platform,
    lastSeenAt,
    isActive,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'registered_devices';
  @override
  VerificationContext validateIntegrity(
    Insertable<RegisteredDevice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('device_id')) {
      context.handle(
        _deviceIdMeta,
        deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('partner_id')) {
      context.handle(
        _partnerIdMeta,
        partnerId.isAcceptableOrUnknown(data['partner_id']!, _partnerIdMeta),
      );
    }
    if (data.containsKey('device_name')) {
      context.handle(
        _deviceNameMeta,
        deviceName.isAcceptableOrUnknown(data['device_name']!, _deviceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_deviceNameMeta);
    }
    if (data.containsKey('platform')) {
      context.handle(
        _platformMeta,
        platform.isAcceptableOrUnknown(data['platform']!, _platformMeta),
      );
    } else if (isInserting) {
      context.missing(_platformMeta);
    }
    if (data.containsKey('last_seen_at')) {
      context.handle(
        _lastSeenAtMeta,
        lastSeenAt.isAcceptableOrUnknown(
          data['last_seen_at']!,
          _lastSeenAtMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegisteredDevice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RegisteredDevice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      deviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_id'],
      )!,
      partnerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partner_id'],
      ),
      deviceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_name'],
      )!,
      platform: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}platform'],
      )!,
      lastSeenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_seen_at'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RegisteredDevicesTable createAlias(String alias) {
    return $RegisteredDevicesTable(attachedDatabase, alias);
  }
}

class RegisteredDevice extends DataClass
    implements Insertable<RegisteredDevice> {
  final int id;
  final String deviceId;
  final int? partnerId;
  final String deviceName;
  final String platform;
  final DateTime? lastSeenAt;
  final bool isActive;
  final DateTime createdAt;
  const RegisteredDevice({
    required this.id,
    required this.deviceId,
    this.partnerId,
    required this.deviceName,
    required this.platform,
    this.lastSeenAt,
    required this.isActive,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['device_id'] = Variable<String>(deviceId);
    if (!nullToAbsent || partnerId != null) {
      map['partner_id'] = Variable<int>(partnerId);
    }
    map['device_name'] = Variable<String>(deviceName);
    map['platform'] = Variable<String>(platform);
    if (!nullToAbsent || lastSeenAt != null) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RegisteredDevicesCompanion toCompanion(bool nullToAbsent) {
    return RegisteredDevicesCompanion(
      id: Value(id),
      deviceId: Value(deviceId),
      partnerId: partnerId == null && nullToAbsent
          ? const Value.absent()
          : Value(partnerId),
      deviceName: Value(deviceName),
      platform: Value(platform),
      lastSeenAt: lastSeenAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSeenAt),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
    );
  }

  factory RegisteredDevice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RegisteredDevice(
      id: serializer.fromJson<int>(json['id']),
      deviceId: serializer.fromJson<String>(json['deviceId']),
      partnerId: serializer.fromJson<int?>(json['partnerId']),
      deviceName: serializer.fromJson<String>(json['deviceName']),
      platform: serializer.fromJson<String>(json['platform']),
      lastSeenAt: serializer.fromJson<DateTime?>(json['lastSeenAt']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'deviceId': serializer.toJson<String>(deviceId),
      'partnerId': serializer.toJson<int?>(partnerId),
      'deviceName': serializer.toJson<String>(deviceName),
      'platform': serializer.toJson<String>(platform),
      'lastSeenAt': serializer.toJson<DateTime?>(lastSeenAt),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RegisteredDevice copyWith({
    int? id,
    String? deviceId,
    Value<int?> partnerId = const Value.absent(),
    String? deviceName,
    String? platform,
    Value<DateTime?> lastSeenAt = const Value.absent(),
    bool? isActive,
    DateTime? createdAt,
  }) => RegisteredDevice(
    id: id ?? this.id,
    deviceId: deviceId ?? this.deviceId,
    partnerId: partnerId.present ? partnerId.value : this.partnerId,
    deviceName: deviceName ?? this.deviceName,
    platform: platform ?? this.platform,
    lastSeenAt: lastSeenAt.present ? lastSeenAt.value : this.lastSeenAt,
    isActive: isActive ?? this.isActive,
    createdAt: createdAt ?? this.createdAt,
  );
  RegisteredDevice copyWithCompanion(RegisteredDevicesCompanion data) {
    return RegisteredDevice(
      id: data.id.present ? data.id.value : this.id,
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      partnerId: data.partnerId.present ? data.partnerId.value : this.partnerId,
      deviceName: data.deviceName.present
          ? data.deviceName.value
          : this.deviceName,
      platform: data.platform.present ? data.platform.value : this.platform,
      lastSeenAt: data.lastSeenAt.present
          ? data.lastSeenAt.value
          : this.lastSeenAt,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RegisteredDevice(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('partnerId: $partnerId, ')
          ..write('deviceName: $deviceName, ')
          ..write('platform: $platform, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    deviceId,
    partnerId,
    deviceName,
    platform,
    lastSeenAt,
    isActive,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RegisteredDevice &&
          other.id == this.id &&
          other.deviceId == this.deviceId &&
          other.partnerId == this.partnerId &&
          other.deviceName == this.deviceName &&
          other.platform == this.platform &&
          other.lastSeenAt == this.lastSeenAt &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt);
}

class RegisteredDevicesCompanion extends UpdateCompanion<RegisteredDevice> {
  final Value<int> id;
  final Value<String> deviceId;
  final Value<int?> partnerId;
  final Value<String> deviceName;
  final Value<String> platform;
  final Value<DateTime?> lastSeenAt;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  const RegisteredDevicesCompanion({
    this.id = const Value.absent(),
    this.deviceId = const Value.absent(),
    this.partnerId = const Value.absent(),
    this.deviceName = const Value.absent(),
    this.platform = const Value.absent(),
    this.lastSeenAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RegisteredDevicesCompanion.insert({
    this.id = const Value.absent(),
    required String deviceId,
    this.partnerId = const Value.absent(),
    required String deviceName,
    required String platform,
    this.lastSeenAt = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : deviceId = Value(deviceId),
       deviceName = Value(deviceName),
       platform = Value(platform);
  static Insertable<RegisteredDevice> custom({
    Expression<int>? id,
    Expression<String>? deviceId,
    Expression<int>? partnerId,
    Expression<String>? deviceName,
    Expression<String>? platform,
    Expression<DateTime>? lastSeenAt,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (deviceId != null) 'device_id': deviceId,
      if (partnerId != null) 'partner_id': partnerId,
      if (deviceName != null) 'device_name': deviceName,
      if (platform != null) 'platform': platform,
      if (lastSeenAt != null) 'last_seen_at': lastSeenAt,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RegisteredDevicesCompanion copyWith({
    Value<int>? id,
    Value<String>? deviceId,
    Value<int?>? partnerId,
    Value<String>? deviceName,
    Value<String>? platform,
    Value<DateTime?>? lastSeenAt,
    Value<bool>? isActive,
    Value<DateTime>? createdAt,
  }) {
    return RegisteredDevicesCompanion(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      partnerId: partnerId ?? this.partnerId,
      deviceName: deviceName ?? this.deviceName,
      platform: platform ?? this.platform,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (partnerId.present) {
      map['partner_id'] = Variable<int>(partnerId.value);
    }
    if (deviceName.present) {
      map['device_name'] = Variable<String>(deviceName.value);
    }
    if (platform.present) {
      map['platform'] = Variable<String>(platform.value);
    }
    if (lastSeenAt.present) {
      map['last_seen_at'] = Variable<DateTime>(lastSeenAt.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RegisteredDevicesCompanion(')
          ..write('id: $id, ')
          ..write('deviceId: $deviceId, ')
          ..write('partnerId: $partnerId, ')
          ..write('deviceName: $deviceName, ')
          ..write('platform: $platform, ')
          ..write('lastSeenAt: $lastSeenAt, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SocietySmsMessagesTable extends SocietySmsMessages
    with TableInfo<$SocietySmsMessagesTable, SocietySmsMessage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SocietySmsMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _societyIdMeta = const VerificationMeta(
    'societyId',
  );
  @override
  late final GeneratedColumn<int> societyId = GeneratedColumn<int>(
    'society_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milk_societies (id)',
    ),
  );
  static const VerificationMeta _producerIdMeta = const VerificationMeta(
    'producerId',
  );
  @override
  late final GeneratedColumn<int> producerId = GeneratedColumn<int>(
    'producer_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES milk_producers (id)',
    ),
  );
  static const VerificationMeta _senderMeta = const VerificationMeta('sender');
  @override
  late final GeneratedColumn<String> sender = GeneratedColumn<String>(
    'sender',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageBodyMeta = const VerificationMeta(
    'messageBody',
  );
  @override
  late final GeneratedColumn<String> messageBody = GeneratedColumn<String>(
    'message_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
    'received_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceDeviceIdMeta = const VerificationMeta(
    'sourceDeviceId',
  );
  @override
  late final GeneratedColumn<String> sourceDeviceId = GeneratedColumn<String>(
    'source_device_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageFingerprintMeta =
      const VerificationMeta('messageFingerprint');
  @override
  late final GeneratedColumn<String> messageFingerprint =
      GeneratedColumn<String>(
        'message_fingerprint',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      );
  static const VerificationMeta _processingStatusMeta = const VerificationMeta(
    'processingStatus',
  );
  @override
  late final GeneratedColumn<String> processingStatus = GeneratedColumn<String>(
    'processing_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _detectedTypeMeta = const VerificationMeta(
    'detectedType',
  );
  @override
  late final GeneratedColumn<String> detectedType = GeneratedColumn<String>(
    'detected_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _processingErrorMeta = const VerificationMeta(
    'processingError',
  );
  @override
  late final GeneratedColumn<String> processingError = GeneratedColumn<String>(
    'processing_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _processedAtMeta = const VerificationMeta(
    'processedAt',
  );
  @override
  late final GeneratedColumn<DateTime> processedAt = GeneratedColumn<DateTime>(
    'processed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    societyId,
    producerId,
    sender,
    messageBody,
    receivedAt,
    sourceDeviceId,
    messageFingerprint,
    processingStatus,
    detectedType,
    processingError,
    processedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'society_sms_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<SocietySmsMessage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('society_id')) {
      context.handle(
        _societyIdMeta,
        societyId.isAcceptableOrUnknown(data['society_id']!, _societyIdMeta),
      );
    }
    if (data.containsKey('producer_id')) {
      context.handle(
        _producerIdMeta,
        producerId.isAcceptableOrUnknown(data['producer_id']!, _producerIdMeta),
      );
    }
    if (data.containsKey('sender')) {
      context.handle(
        _senderMeta,
        sender.isAcceptableOrUnknown(data['sender']!, _senderMeta),
      );
    } else if (isInserting) {
      context.missing(_senderMeta);
    }
    if (data.containsKey('message_body')) {
      context.handle(
        _messageBodyMeta,
        messageBody.isAcceptableOrUnknown(
          data['message_body']!,
          _messageBodyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_messageBodyMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('source_device_id')) {
      context.handle(
        _sourceDeviceIdMeta,
        sourceDeviceId.isAcceptableOrUnknown(
          data['source_device_id']!,
          _sourceDeviceIdMeta,
        ),
      );
    }
    if (data.containsKey('message_fingerprint')) {
      context.handle(
        _messageFingerprintMeta,
        messageFingerprint.isAcceptableOrUnknown(
          data['message_fingerprint']!,
          _messageFingerprintMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_messageFingerprintMeta);
    }
    if (data.containsKey('processing_status')) {
      context.handle(
        _processingStatusMeta,
        processingStatus.isAcceptableOrUnknown(
          data['processing_status']!,
          _processingStatusMeta,
        ),
      );
    }
    if (data.containsKey('detected_type')) {
      context.handle(
        _detectedTypeMeta,
        detectedType.isAcceptableOrUnknown(
          data['detected_type']!,
          _detectedTypeMeta,
        ),
      );
    }
    if (data.containsKey('processing_error')) {
      context.handle(
        _processingErrorMeta,
        processingError.isAcceptableOrUnknown(
          data['processing_error']!,
          _processingErrorMeta,
        ),
      );
    }
    if (data.containsKey('processed_at')) {
      context.handle(
        _processedAtMeta,
        processedAt.isAcceptableOrUnknown(
          data['processed_at']!,
          _processedAtMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SocietySmsMessage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SocietySmsMessage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      societyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}society_id'],
      ),
      producerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}producer_id'],
      ),
      sender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sender'],
      )!,
      messageBody: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_body'],
      )!,
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}received_at'],
      )!,
      sourceDeviceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_device_id'],
      ),
      messageFingerprint: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message_fingerprint'],
      )!,
      processingStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}processing_status'],
      )!,
      detectedType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}detected_type'],
      ),
      processingError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}processing_error'],
      ),
      processedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}processed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SocietySmsMessagesTable createAlias(String alias) {
    return $SocietySmsMessagesTable(attachedDatabase, alias);
  }
}

class SocietySmsMessage extends DataClass
    implements Insertable<SocietySmsMessage> {
  final int id;
  final int? societyId;
  final int? producerId;
  final String sender;
  final String messageBody;
  final DateTime receivedAt;
  final String? sourceDeviceId;
  final String messageFingerprint;
  final String processingStatus;
  final String? detectedType;
  final String? processingError;
  final DateTime? processedAt;
  final DateTime createdAt;
  const SocietySmsMessage({
    required this.id,
    this.societyId,
    this.producerId,
    required this.sender,
    required this.messageBody,
    required this.receivedAt,
    this.sourceDeviceId,
    required this.messageFingerprint,
    required this.processingStatus,
    this.detectedType,
    this.processingError,
    this.processedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || societyId != null) {
      map['society_id'] = Variable<int>(societyId);
    }
    if (!nullToAbsent || producerId != null) {
      map['producer_id'] = Variable<int>(producerId);
    }
    map['sender'] = Variable<String>(sender);
    map['message_body'] = Variable<String>(messageBody);
    map['received_at'] = Variable<DateTime>(receivedAt);
    if (!nullToAbsent || sourceDeviceId != null) {
      map['source_device_id'] = Variable<String>(sourceDeviceId);
    }
    map['message_fingerprint'] = Variable<String>(messageFingerprint);
    map['processing_status'] = Variable<String>(processingStatus);
    if (!nullToAbsent || detectedType != null) {
      map['detected_type'] = Variable<String>(detectedType);
    }
    if (!nullToAbsent || processingError != null) {
      map['processing_error'] = Variable<String>(processingError);
    }
    if (!nullToAbsent || processedAt != null) {
      map['processed_at'] = Variable<DateTime>(processedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SocietySmsMessagesCompanion toCompanion(bool nullToAbsent) {
    return SocietySmsMessagesCompanion(
      id: Value(id),
      societyId: societyId == null && nullToAbsent
          ? const Value.absent()
          : Value(societyId),
      producerId: producerId == null && nullToAbsent
          ? const Value.absent()
          : Value(producerId),
      sender: Value(sender),
      messageBody: Value(messageBody),
      receivedAt: Value(receivedAt),
      sourceDeviceId: sourceDeviceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceDeviceId),
      messageFingerprint: Value(messageFingerprint),
      processingStatus: Value(processingStatus),
      detectedType: detectedType == null && nullToAbsent
          ? const Value.absent()
          : Value(detectedType),
      processingError: processingError == null && nullToAbsent
          ? const Value.absent()
          : Value(processingError),
      processedAt: processedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(processedAt),
      createdAt: Value(createdAt),
    );
  }

  factory SocietySmsMessage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SocietySmsMessage(
      id: serializer.fromJson<int>(json['id']),
      societyId: serializer.fromJson<int?>(json['societyId']),
      producerId: serializer.fromJson<int?>(json['producerId']),
      sender: serializer.fromJson<String>(json['sender']),
      messageBody: serializer.fromJson<String>(json['messageBody']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      sourceDeviceId: serializer.fromJson<String?>(json['sourceDeviceId']),
      messageFingerprint: serializer.fromJson<String>(
        json['messageFingerprint'],
      ),
      processingStatus: serializer.fromJson<String>(json['processingStatus']),
      detectedType: serializer.fromJson<String?>(json['detectedType']),
      processingError: serializer.fromJson<String?>(json['processingError']),
      processedAt: serializer.fromJson<DateTime?>(json['processedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'societyId': serializer.toJson<int?>(societyId),
      'producerId': serializer.toJson<int?>(producerId),
      'sender': serializer.toJson<String>(sender),
      'messageBody': serializer.toJson<String>(messageBody),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'sourceDeviceId': serializer.toJson<String?>(sourceDeviceId),
      'messageFingerprint': serializer.toJson<String>(messageFingerprint),
      'processingStatus': serializer.toJson<String>(processingStatus),
      'detectedType': serializer.toJson<String?>(detectedType),
      'processingError': serializer.toJson<String?>(processingError),
      'processedAt': serializer.toJson<DateTime?>(processedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SocietySmsMessage copyWith({
    int? id,
    Value<int?> societyId = const Value.absent(),
    Value<int?> producerId = const Value.absent(),
    String? sender,
    String? messageBody,
    DateTime? receivedAt,
    Value<String?> sourceDeviceId = const Value.absent(),
    String? messageFingerprint,
    String? processingStatus,
    Value<String?> detectedType = const Value.absent(),
    Value<String?> processingError = const Value.absent(),
    Value<DateTime?> processedAt = const Value.absent(),
    DateTime? createdAt,
  }) => SocietySmsMessage(
    id: id ?? this.id,
    societyId: societyId.present ? societyId.value : this.societyId,
    producerId: producerId.present ? producerId.value : this.producerId,
    sender: sender ?? this.sender,
    messageBody: messageBody ?? this.messageBody,
    receivedAt: receivedAt ?? this.receivedAt,
    sourceDeviceId: sourceDeviceId.present
        ? sourceDeviceId.value
        : this.sourceDeviceId,
    messageFingerprint: messageFingerprint ?? this.messageFingerprint,
    processingStatus: processingStatus ?? this.processingStatus,
    detectedType: detectedType.present ? detectedType.value : this.detectedType,
    processingError: processingError.present
        ? processingError.value
        : this.processingError,
    processedAt: processedAt.present ? processedAt.value : this.processedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  SocietySmsMessage copyWithCompanion(SocietySmsMessagesCompanion data) {
    return SocietySmsMessage(
      id: data.id.present ? data.id.value : this.id,
      societyId: data.societyId.present ? data.societyId.value : this.societyId,
      producerId: data.producerId.present
          ? data.producerId.value
          : this.producerId,
      sender: data.sender.present ? data.sender.value : this.sender,
      messageBody: data.messageBody.present
          ? data.messageBody.value
          : this.messageBody,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      sourceDeviceId: data.sourceDeviceId.present
          ? data.sourceDeviceId.value
          : this.sourceDeviceId,
      messageFingerprint: data.messageFingerprint.present
          ? data.messageFingerprint.value
          : this.messageFingerprint,
      processingStatus: data.processingStatus.present
          ? data.processingStatus.value
          : this.processingStatus,
      detectedType: data.detectedType.present
          ? data.detectedType.value
          : this.detectedType,
      processingError: data.processingError.present
          ? data.processingError.value
          : this.processingError,
      processedAt: data.processedAt.present
          ? data.processedAt.value
          : this.processedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SocietySmsMessage(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('producerId: $producerId, ')
          ..write('sender: $sender, ')
          ..write('messageBody: $messageBody, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('sourceDeviceId: $sourceDeviceId, ')
          ..write('messageFingerprint: $messageFingerprint, ')
          ..write('processingStatus: $processingStatus, ')
          ..write('detectedType: $detectedType, ')
          ..write('processingError: $processingError, ')
          ..write('processedAt: $processedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    societyId,
    producerId,
    sender,
    messageBody,
    receivedAt,
    sourceDeviceId,
    messageFingerprint,
    processingStatus,
    detectedType,
    processingError,
    processedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocietySmsMessage &&
          other.id == this.id &&
          other.societyId == this.societyId &&
          other.producerId == this.producerId &&
          other.sender == this.sender &&
          other.messageBody == this.messageBody &&
          other.receivedAt == this.receivedAt &&
          other.sourceDeviceId == this.sourceDeviceId &&
          other.messageFingerprint == this.messageFingerprint &&
          other.processingStatus == this.processingStatus &&
          other.detectedType == this.detectedType &&
          other.processingError == this.processingError &&
          other.processedAt == this.processedAt &&
          other.createdAt == this.createdAt);
}

class SocietySmsMessagesCompanion extends UpdateCompanion<SocietySmsMessage> {
  final Value<int> id;
  final Value<int?> societyId;
  final Value<int?> producerId;
  final Value<String> sender;
  final Value<String> messageBody;
  final Value<DateTime> receivedAt;
  final Value<String?> sourceDeviceId;
  final Value<String> messageFingerprint;
  final Value<String> processingStatus;
  final Value<String?> detectedType;
  final Value<String?> processingError;
  final Value<DateTime?> processedAt;
  final Value<DateTime> createdAt;
  const SocietySmsMessagesCompanion({
    this.id = const Value.absent(),
    this.societyId = const Value.absent(),
    this.producerId = const Value.absent(),
    this.sender = const Value.absent(),
    this.messageBody = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.sourceDeviceId = const Value.absent(),
    this.messageFingerprint = const Value.absent(),
    this.processingStatus = const Value.absent(),
    this.detectedType = const Value.absent(),
    this.processingError = const Value.absent(),
    this.processedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SocietySmsMessagesCompanion.insert({
    this.id = const Value.absent(),
    this.societyId = const Value.absent(),
    this.producerId = const Value.absent(),
    required String sender,
    required String messageBody,
    required DateTime receivedAt,
    this.sourceDeviceId = const Value.absent(),
    required String messageFingerprint,
    this.processingStatus = const Value.absent(),
    this.detectedType = const Value.absent(),
    this.processingError = const Value.absent(),
    this.processedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : sender = Value(sender),
       messageBody = Value(messageBody),
       receivedAt = Value(receivedAt),
       messageFingerprint = Value(messageFingerprint);
  static Insertable<SocietySmsMessage> custom({
    Expression<int>? id,
    Expression<int>? societyId,
    Expression<int>? producerId,
    Expression<String>? sender,
    Expression<String>? messageBody,
    Expression<DateTime>? receivedAt,
    Expression<String>? sourceDeviceId,
    Expression<String>? messageFingerprint,
    Expression<String>? processingStatus,
    Expression<String>? detectedType,
    Expression<String>? processingError,
    Expression<DateTime>? processedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (societyId != null) 'society_id': societyId,
      if (producerId != null) 'producer_id': producerId,
      if (sender != null) 'sender': sender,
      if (messageBody != null) 'message_body': messageBody,
      if (receivedAt != null) 'received_at': receivedAt,
      if (sourceDeviceId != null) 'source_device_id': sourceDeviceId,
      if (messageFingerprint != null) 'message_fingerprint': messageFingerprint,
      if (processingStatus != null) 'processing_status': processingStatus,
      if (detectedType != null) 'detected_type': detectedType,
      if (processingError != null) 'processing_error': processingError,
      if (processedAt != null) 'processed_at': processedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SocietySmsMessagesCompanion copyWith({
    Value<int>? id,
    Value<int?>? societyId,
    Value<int?>? producerId,
    Value<String>? sender,
    Value<String>? messageBody,
    Value<DateTime>? receivedAt,
    Value<String?>? sourceDeviceId,
    Value<String>? messageFingerprint,
    Value<String>? processingStatus,
    Value<String?>? detectedType,
    Value<String?>? processingError,
    Value<DateTime?>? processedAt,
    Value<DateTime>? createdAt,
  }) {
    return SocietySmsMessagesCompanion(
      id: id ?? this.id,
      societyId: societyId ?? this.societyId,
      producerId: producerId ?? this.producerId,
      sender: sender ?? this.sender,
      messageBody: messageBody ?? this.messageBody,
      receivedAt: receivedAt ?? this.receivedAt,
      sourceDeviceId: sourceDeviceId ?? this.sourceDeviceId,
      messageFingerprint: messageFingerprint ?? this.messageFingerprint,
      processingStatus: processingStatus ?? this.processingStatus,
      detectedType: detectedType ?? this.detectedType,
      processingError: processingError ?? this.processingError,
      processedAt: processedAt ?? this.processedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (societyId.present) {
      map['society_id'] = Variable<int>(societyId.value);
    }
    if (producerId.present) {
      map['producer_id'] = Variable<int>(producerId.value);
    }
    if (sender.present) {
      map['sender'] = Variable<String>(sender.value);
    }
    if (messageBody.present) {
      map['message_body'] = Variable<String>(messageBody.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (sourceDeviceId.present) {
      map['source_device_id'] = Variable<String>(sourceDeviceId.value);
    }
    if (messageFingerprint.present) {
      map['message_fingerprint'] = Variable<String>(messageFingerprint.value);
    }
    if (processingStatus.present) {
      map['processing_status'] = Variable<String>(processingStatus.value);
    }
    if (detectedType.present) {
      map['detected_type'] = Variable<String>(detectedType.value);
    }
    if (processingError.present) {
      map['processing_error'] = Variable<String>(processingError.value);
    }
    if (processedAt.present) {
      map['processed_at'] = Variable<DateTime>(processedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SocietySmsMessagesCompanion(')
          ..write('id: $id, ')
          ..write('societyId: $societyId, ')
          ..write('producerId: $producerId, ')
          ..write('sender: $sender, ')
          ..write('messageBody: $messageBody, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('sourceDeviceId: $sourceDeviceId, ')
          ..write('messageFingerprint: $messageFingerprint, ')
          ..write('processingStatus: $processingStatus, ')
          ..write('detectedType: $detectedType, ')
          ..write('processingError: $processingError, ')
          ..write('processedAt: $processedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SocietySmsAccountingEntriesTable extends SocietySmsAccountingEntries
    with
        TableInfo<
          $SocietySmsAccountingEntriesTable,
          SocietySmsAccountingEntry
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SocietySmsAccountingEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _smsMessageIdMeta = const VerificationMeta(
    'smsMessageId',
  );
  @override
  late final GeneratedColumn<int> smsMessageId = GeneratedColumn<int>(
    'sms_message_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES society_sms_messages (id)',
    ),
  );
  static const VerificationMeta _financialTransactionIdMeta =
      const VerificationMeta('financialTransactionId');
  @override
  late final GeneratedColumn<int> financialTransactionId = GeneratedColumn<int>(
    'financial_transaction_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES financial_transactions (id)',
    ),
  );
  static const VerificationMeta _entryTypeMeta = const VerificationMeta(
    'entryType',
  );
  @override
  late final GeneratedColumn<String> entryType = GeneratedColumn<String>(
    'entry_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transactionDateMeta = const VerificationMeta(
    'transactionDate',
  );
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>(
        'transaction_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _bankNameMeta = const VerificationMeta(
    'bankName',
  );
  @override
  late final GeneratedColumn<String> bankName = GeneratedColumn<String>(
    'bank_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    smsMessageId,
    financialTransactionId,
    entryType,
    amount,
    transactionDate,
    bankName,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'society_sms_accounting_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<SocietySmsAccountingEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sms_message_id')) {
      context.handle(
        _smsMessageIdMeta,
        smsMessageId.isAcceptableOrUnknown(
          data['sms_message_id']!,
          _smsMessageIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_smsMessageIdMeta);
    }
    if (data.containsKey('financial_transaction_id')) {
      context.handle(
        _financialTransactionIdMeta,
        financialTransactionId.isAcceptableOrUnknown(
          data['financial_transaction_id']!,
          _financialTransactionIdMeta,
        ),
      );
    }
    if (data.containsKey('entry_type')) {
      context.handle(
        _entryTypeMeta,
        entryType.isAcceptableOrUnknown(data['entry_type']!, _entryTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entryTypeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
        _transactionDateMeta,
        transactionDate.isAcceptableOrUnknown(
          data['transaction_date']!,
          _transactionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('bank_name')) {
      context.handle(
        _bankNameMeta,
        bankName.isAcceptableOrUnknown(data['bank_name']!, _bankNameMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SocietySmsAccountingEntry map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SocietySmsAccountingEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      smsMessageId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sms_message_id'],
      )!,
      financialTransactionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}financial_transaction_id'],
      ),
      entryType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entry_type'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      transactionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}transaction_date'],
      )!,
      bankName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bank_name'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SocietySmsAccountingEntriesTable createAlias(String alias) {
    return $SocietySmsAccountingEntriesTable(attachedDatabase, alias);
  }
}

class SocietySmsAccountingEntry extends DataClass
    implements Insertable<SocietySmsAccountingEntry> {
  final int id;
  final int smsMessageId;
  final int? financialTransactionId;
  final String entryType;
  final double amount;
  final DateTime transactionDate;
  final String? bankName;
  final DateTime createdAt;
  const SocietySmsAccountingEntry({
    required this.id,
    required this.smsMessageId,
    this.financialTransactionId,
    required this.entryType,
    required this.amount,
    required this.transactionDate,
    this.bankName,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sms_message_id'] = Variable<int>(smsMessageId);
    if (!nullToAbsent || financialTransactionId != null) {
      map['financial_transaction_id'] = Variable<int>(financialTransactionId);
    }
    map['entry_type'] = Variable<String>(entryType);
    map['amount'] = Variable<double>(amount);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    if (!nullToAbsent || bankName != null) {
      map['bank_name'] = Variable<String>(bankName);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SocietySmsAccountingEntriesCompanion toCompanion(bool nullToAbsent) {
    return SocietySmsAccountingEntriesCompanion(
      id: Value(id),
      smsMessageId: Value(smsMessageId),
      financialTransactionId: financialTransactionId == null && nullToAbsent
          ? const Value.absent()
          : Value(financialTransactionId),
      entryType: Value(entryType),
      amount: Value(amount),
      transactionDate: Value(transactionDate),
      bankName: bankName == null && nullToAbsent
          ? const Value.absent()
          : Value(bankName),
      createdAt: Value(createdAt),
    );
  }

  factory SocietySmsAccountingEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SocietySmsAccountingEntry(
      id: serializer.fromJson<int>(json['id']),
      smsMessageId: serializer.fromJson<int>(json['smsMessageId']),
      financialTransactionId: serializer.fromJson<int?>(
        json['financialTransactionId'],
      ),
      entryType: serializer.fromJson<String>(json['entryType']),
      amount: serializer.fromJson<double>(json['amount']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      bankName: serializer.fromJson<String?>(json['bankName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'smsMessageId': serializer.toJson<int>(smsMessageId),
      'financialTransactionId': serializer.toJson<int?>(financialTransactionId),
      'entryType': serializer.toJson<String>(entryType),
      'amount': serializer.toJson<double>(amount),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'bankName': serializer.toJson<String?>(bankName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SocietySmsAccountingEntry copyWith({
    int? id,
    int? smsMessageId,
    Value<int?> financialTransactionId = const Value.absent(),
    String? entryType,
    double? amount,
    DateTime? transactionDate,
    Value<String?> bankName = const Value.absent(),
    DateTime? createdAt,
  }) => SocietySmsAccountingEntry(
    id: id ?? this.id,
    smsMessageId: smsMessageId ?? this.smsMessageId,
    financialTransactionId: financialTransactionId.present
        ? financialTransactionId.value
        : this.financialTransactionId,
    entryType: entryType ?? this.entryType,
    amount: amount ?? this.amount,
    transactionDate: transactionDate ?? this.transactionDate,
    bankName: bankName.present ? bankName.value : this.bankName,
    createdAt: createdAt ?? this.createdAt,
  );
  SocietySmsAccountingEntry copyWithCompanion(
    SocietySmsAccountingEntriesCompanion data,
  ) {
    return SocietySmsAccountingEntry(
      id: data.id.present ? data.id.value : this.id,
      smsMessageId: data.smsMessageId.present
          ? data.smsMessageId.value
          : this.smsMessageId,
      financialTransactionId: data.financialTransactionId.present
          ? data.financialTransactionId.value
          : this.financialTransactionId,
      entryType: data.entryType.present ? data.entryType.value : this.entryType,
      amount: data.amount.present ? data.amount.value : this.amount,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      bankName: data.bankName.present ? data.bankName.value : this.bankName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SocietySmsAccountingEntry(')
          ..write('id: $id, ')
          ..write('smsMessageId: $smsMessageId, ')
          ..write('financialTransactionId: $financialTransactionId, ')
          ..write('entryType: $entryType, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('bankName: $bankName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    smsMessageId,
    financialTransactionId,
    entryType,
    amount,
    transactionDate,
    bankName,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocietySmsAccountingEntry &&
          other.id == this.id &&
          other.smsMessageId == this.smsMessageId &&
          other.financialTransactionId == this.financialTransactionId &&
          other.entryType == this.entryType &&
          other.amount == this.amount &&
          other.transactionDate == this.transactionDate &&
          other.bankName == this.bankName &&
          other.createdAt == this.createdAt);
}

class SocietySmsAccountingEntriesCompanion
    extends UpdateCompanion<SocietySmsAccountingEntry> {
  final Value<int> id;
  final Value<int> smsMessageId;
  final Value<int?> financialTransactionId;
  final Value<String> entryType;
  final Value<double> amount;
  final Value<DateTime> transactionDate;
  final Value<String?> bankName;
  final Value<DateTime> createdAt;
  const SocietySmsAccountingEntriesCompanion({
    this.id = const Value.absent(),
    this.smsMessageId = const Value.absent(),
    this.financialTransactionId = const Value.absent(),
    this.entryType = const Value.absent(),
    this.amount = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.bankName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SocietySmsAccountingEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int smsMessageId,
    this.financialTransactionId = const Value.absent(),
    required String entryType,
    required double amount,
    required DateTime transactionDate,
    this.bankName = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : smsMessageId = Value(smsMessageId),
       entryType = Value(entryType),
       amount = Value(amount),
       transactionDate = Value(transactionDate);
  static Insertable<SocietySmsAccountingEntry> custom({
    Expression<int>? id,
    Expression<int>? smsMessageId,
    Expression<int>? financialTransactionId,
    Expression<String>? entryType,
    Expression<double>? amount,
    Expression<DateTime>? transactionDate,
    Expression<String>? bankName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (smsMessageId != null) 'sms_message_id': smsMessageId,
      if (financialTransactionId != null)
        'financial_transaction_id': financialTransactionId,
      if (entryType != null) 'entry_type': entryType,
      if (amount != null) 'amount': amount,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (bankName != null) 'bank_name': bankName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SocietySmsAccountingEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? smsMessageId,
    Value<int?>? financialTransactionId,
    Value<String>? entryType,
    Value<double>? amount,
    Value<DateTime>? transactionDate,
    Value<String?>? bankName,
    Value<DateTime>? createdAt,
  }) {
    return SocietySmsAccountingEntriesCompanion(
      id: id ?? this.id,
      smsMessageId: smsMessageId ?? this.smsMessageId,
      financialTransactionId:
          financialTransactionId ?? this.financialTransactionId,
      entryType: entryType ?? this.entryType,
      amount: amount ?? this.amount,
      transactionDate: transactionDate ?? this.transactionDate,
      bankName: bankName ?? this.bankName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (smsMessageId.present) {
      map['sms_message_id'] = Variable<int>(smsMessageId.value);
    }
    if (financialTransactionId.present) {
      map['financial_transaction_id'] = Variable<int>(
        financialTransactionId.value,
      );
    }
    if (entryType.present) {
      map['entry_type'] = Variable<String>(entryType.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (bankName.present) {
      map['bank_name'] = Variable<String>(bankName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SocietySmsAccountingEntriesCompanion(')
          ..write('id: $id, ')
          ..write('smsMessageId: $smsMessageId, ')
          ..write('financialTransactionId: $financialTransactionId, ')
          ..write('entryType: $entryType, ')
          ..write('amount: $amount, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('bankName: $bankName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $BusinessGroupsTable businessGroups = $BusinessGroupsTable(this);
  late final $BusinessesTable businesses = $BusinessesTable(this);
  late final $PartnersTable partners = $PartnersTable(this);
  late final $BusinessPartnersTable businessPartners = $BusinessPartnersTable(
    this,
  );
  late final $FinancialTransactionsTable financialTransactions =
      $FinancialTransactionsTable(this);
  late final $TransactionAuditLogsTable transactionAuditLogs =
      $TransactionAuditLogsTable(this);
  late final $MilkSocietiesTable milkSocieties = $MilkSocietiesTable(this);
  late final $SocietySendersTable societySenders = $SocietySendersTable(this);
  late final $MilkProducersTable milkProducers = $MilkProducersTable(this);
  late final $RegisteredDevicesTable registeredDevices =
      $RegisteredDevicesTable(this);
  late final $SocietySmsMessagesTable societySmsMessages =
      $SocietySmsMessagesTable(this);
  late final $SocietySmsAccountingEntriesTable societySmsAccountingEntries =
      $SocietySmsAccountingEntriesTable(this);
  late final Index idxSocietySmsAccountingMessage = Index(
    'idx_society_sms_accounting_message',
    'CREATE UNIQUE INDEX idx_society_sms_accounting_message ON society_sms_accounting_entries (sms_message_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    businessGroups,
    businesses,
    partners,
    businessPartners,
    financialTransactions,
    transactionAuditLogs,
    milkSocieties,
    societySenders,
    milkProducers,
    registeredDevices,
    societySmsMessages,
    societySmsAccountingEntries,
    idxSocietySmsAccountingMessage,
  ];
}

typedef $$BusinessGroupsTableCreateCompanionBuilder =
    BusinessGroupsCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> description,
      Value<DateTime> createdAt,
    });
typedef $$BusinessGroupsTableUpdateCompanionBuilder =
    BusinessGroupsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> description,
      Value<DateTime> createdAt,
    });

final class $$BusinessGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $BusinessGroupsTable, BusinessGroup> {
  $$BusinessGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$BusinessesTable, List<BusinessesData>>
  _businessesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.businesses,
    aliasName: 'business_groups__id__businesses__group_id',
  );

  $$BusinessesTableProcessedTableManager get businessesRefs {
    final manager = $$BusinessesTableTableManager(
      $_db,
      $_db.businesses,
    ).filter((f) => f.groupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_businessesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BusinessGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessGroupsTable> {
  $$BusinessGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> businessesRefs(
    Expression<bool> Function($$BusinessesTableFilterComposer f) f,
  ) {
    final $$BusinessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableFilterComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessGroupsTable> {
  $$BusinessGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BusinessGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessGroupsTable> {
  $$BusinessGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> businessesRefs<T extends Object>(
    Expression<T> Function($$BusinessesTableAnnotationComposer a) f,
  ) {
    final $$BusinessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.groupId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableAnnotationComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessGroupsTable,
          BusinessGroup,
          $$BusinessGroupsTableFilterComposer,
          $$BusinessGroupsTableOrderingComposer,
          $$BusinessGroupsTableAnnotationComposer,
          $$BusinessGroupsTableCreateCompanionBuilder,
          $$BusinessGroupsTableUpdateCompanionBuilder,
          (BusinessGroup, $$BusinessGroupsTableReferences),
          BusinessGroup,
          PrefetchHooks Function({bool businessesRefs})
        > {
  $$BusinessGroupsTableTableManager(
    _$AppDatabase db,
    $BusinessGroupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessGroupsCompanion(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> description = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessGroupsCompanion.insert(
                id: id,
                name: name,
                description: description,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessGroupsTable, BusinessGroup>(table),
                  $$BusinessGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({businessesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (businessesRefs) db.businesses],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (businessesRefs)
                    await $_getPrefetchedDataByColumns<
                      BusinessGroup,
                      $BusinessGroupsTable,
                      BusinessesData,
                      $BusinessesTable
                    >(
                      currentTable: table,
                      referencedTable: $$BusinessGroupsTableReferences
                          ._businessesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$BusinessGroupsTableReferences(
                            db,
                            table,
                            p0,
                          ).businessesRefs,
                      currentColumn: 'id',
                      referencedColumn: 'group_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BusinessGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessGroupsTable,
      BusinessGroup,
      $$BusinessGroupsTableFilterComposer,
      $$BusinessGroupsTableOrderingComposer,
      $$BusinessGroupsTableAnnotationComposer,
      $$BusinessGroupsTableCreateCompanionBuilder,
      $$BusinessGroupsTableUpdateCompanionBuilder,
      (BusinessGroup, $$BusinessGroupsTableReferences),
      BusinessGroup,
      PrefetchHooks Function({bool businessesRefs})
    >;
typedef $$BusinessesTableCreateCompanionBuilder = BusinessesCompanion Function({
  Value<int> id,
  required String name,
  required String businessType,
  Value<int?> groupId,
  Value<String?> location,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});
typedef $$BusinessesTableUpdateCompanionBuilder = BusinessesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> businessType,
  Value<int?> groupId,
  Value<String?> location,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});

final class $$BusinessesTableReferences
    extends BaseReferences<_$AppDatabase, $BusinessesTable, BusinessesData> {
  $$BusinessesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $BusinessGroupsTable _groupIdTable(_$AppDatabase db) => db
      .businessGroups
      .createAlias('businesses__group_id__business_groups__id');

  $$BusinessGroupsTableProcessedTableManager? get groupId {
    final $_column = $_itemColumn<int>('group_id');
    if ($_column == null) return null;
    final manager = $$BusinessGroupsTableTableManager(
      $_db,
      $_db.businessGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$BusinessPartnersTable, List<BusinessPartner>>
  _businessPartnersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.businessPartners,
    aliasName: 'businesses__id__business_partners__business_id',
  );

  $$BusinessPartnersTableProcessedTableManager get businessPartnersRefs {
    final manager = $$BusinessPartnersTableTableManager(
      $_db,
      $_db.businessPartners,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _businessPartnersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $FinancialTransactionsTable,
    List<FinancialTransaction>
  >
  _financialTransactionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.financialTransactions,
        aliasName: 'businesses__id__financial_transactions__business_id',
      );

  $$FinancialTransactionsTableProcessedTableManager
  get financialTransactionsRefs {
    final manager = $$FinancialTransactionsTableTableManager(
      $_db,
      $_db.financialTransactions,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _financialTransactionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MilkSocietiesTable, List<MilkSociety>>
  _milkSocietiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.milkSocieties,
    aliasName: 'businesses__id__milk_societies__business_id',
  );

  $$MilkSocietiesTableProcessedTableManager get milkSocietiesRefs {
    final manager = $$MilkSocietiesTableTableManager(
      $_db,
      $_db.milkSocieties,
    ).filter((f) => f.businessId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_milkSocietiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BusinessesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get businessType => $composableBuilder(
    column: $table.businessType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessGroupsTableFilterComposer get groupId {
    final $$BusinessGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.businessGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessGroupsTableFilterComposer(
            $db: $db,
            $table: $db.businessGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> businessPartnersRefs(
    Expression<bool> Function($$BusinessPartnersTableFilterComposer f) f,
  ) {
    final $$BusinessPartnersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businessPartners,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessPartnersTableFilterComposer(
            $db: $db,
            $table: $db.businessPartners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> financialTransactionsRefs(
    Expression<bool> Function($$FinancialTransactionsTableFilterComposer f) f,
  ) {
    final $$FinancialTransactionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.financialTransactions,
          getReferencedColumn: (t) => t.businessId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FinancialTransactionsTableFilterComposer(
                $db: $db,
                $table: $db.financialTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> milkSocietiesRefs(
    Expression<bool> Function($$MilkSocietiesTableFilterComposer f) f,
  ) {
    final $$MilkSocietiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableFilterComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get businessType => $composableBuilder(
    column: $table.businessType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessGroupsTableOrderingComposer get groupId {
    final $$BusinessGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.businessGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.businessGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusinessesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessesTable> {
  $$BusinessesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get businessType => $composableBuilder(
    column: $table.businessType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BusinessGroupsTableAnnotationComposer get groupId {
    final $$BusinessGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupId,
      referencedTable: $db.businessGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.businessGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> businessPartnersRefs<T extends Object>(
    Expression<T> Function($$BusinessPartnersTableAnnotationComposer a) f,
  ) {
    final $$BusinessPartnersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businessPartners,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessPartnersTableAnnotationComposer(
            $db: $db,
            $table: $db.businessPartners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> financialTransactionsRefs<T extends Object>(
    Expression<T> Function($$FinancialTransactionsTableAnnotationComposer a) f,
  ) {
    final $$FinancialTransactionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.financialTransactions,
          getReferencedColumn: (t) => t.businessId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FinancialTransactionsTableAnnotationComposer(
                $db: $db,
                $table: $db.financialTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> milkSocietiesRefs<T extends Object>(
    Expression<T> Function($$MilkSocietiesTableAnnotationComposer a) f,
  ) {
    final $$MilkSocietiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.businessId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableAnnotationComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BusinessesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessesTable,
          BusinessesData,
          $$BusinessesTableFilterComposer,
          $$BusinessesTableOrderingComposer,
          $$BusinessesTableAnnotationComposer,
          $$BusinessesTableCreateCompanionBuilder,
          $$BusinessesTableUpdateCompanionBuilder,
          (BusinessesData, $$BusinessesTableReferences),
          BusinessesData,
          PrefetchHooks Function({
            bool groupId,
            bool businessPartnersRefs,
            bool financialTransactionsRefs,
            bool milkSocietiesRefs,
          })
        > {
  $$BusinessesTableTableManager(_$AppDatabase db, $BusinessesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> businessType = const Value.absent(),
                Value<int?> groupId = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessesCompanion(
                id: id,
                name: name,
                businessType: businessType,
                groupId: groupId,
                location: location,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String businessType,
                Value<int?> groupId = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessesCompanion.insert(
                id: id,
                name: name,
                businessType: businessType,
                groupId: groupId,
                location: location,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessesTable, BusinessesData>(table),
                  $$BusinessesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                groupId = false,
                businessPartnersRefs = false,
                financialTransactionsRefs = false,
                milkSocietiesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (businessPartnersRefs) db.businessPartners,
                    if (financialTransactionsRefs) db.financialTransactions,
                    if (milkSocietiesRefs) db.milkSocieties,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (groupId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.groupId,
                            referencedTable: $$BusinessesTableReferences
                                ._groupIdTable(db),
                            referencedColumn: $$BusinessesTableReferences
                                ._groupIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (businessPartnersRefs)
                        await $_getPrefetchedDataByColumns<
                          BusinessesData,
                          $BusinessesTable,
                          BusinessPartner,
                          $BusinessPartnersTable
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessesTableReferences
                              ._businessPartnersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessesTableReferences(
                                db,
                                table,
                                p0,
                              ).businessPartnersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'business_id',
                          typedResults: items,
                        ),
                      if (financialTransactionsRefs)
                        await $_getPrefetchedDataByColumns<
                          BusinessesData,
                          $BusinessesTable,
                          FinancialTransaction,
                          $FinancialTransactionsTable
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessesTableReferences
                              ._financialTransactionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessesTableReferences(
                                db,
                                table,
                                p0,
                              ).financialTransactionsRefs,
                          currentColumn: 'id',
                          referencedColumn: 'business_id',
                          typedResults: items,
                        ),
                      if (milkSocietiesRefs)
                        await $_getPrefetchedDataByColumns<
                          BusinessesData,
                          $BusinessesTable,
                          MilkSociety,
                          $MilkSocietiesTable
                        >(
                          currentTable: table,
                          referencedTable: $$BusinessesTableReferences
                              ._milkSocietiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$BusinessesTableReferences(
                                db,
                                table,
                                p0,
                              ).milkSocietiesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'business_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$BusinessesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessesTable,
      BusinessesData,
      $$BusinessesTableFilterComposer,
      $$BusinessesTableOrderingComposer,
      $$BusinessesTableAnnotationComposer,
      $$BusinessesTableCreateCompanionBuilder,
      $$BusinessesTableUpdateCompanionBuilder,
      (BusinessesData, $$BusinessesTableReferences),
      BusinessesData,
      PrefetchHooks Function({
        bool groupId,
        bool businessPartnersRefs,
        bool financialTransactionsRefs,
        bool milkSocietiesRefs,
      })
    >;
typedef $$PartnersTableCreateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});
typedef $$PartnersTableUpdateCompanionBuilder = PartnersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
});

final class $$PartnersTableReferences
    extends BaseReferences<_$AppDatabase, $PartnersTable, Partner> {
  $$PartnersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BusinessPartnersTable, List<BusinessPartner>>
  _businessPartnersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.businessPartners,
    aliasName: 'partners__id__business_partners__partner_id',
  );

  $$BusinessPartnersTableProcessedTableManager get businessPartnersRefs {
    final manager = $$BusinessPartnersTableTableManager(
      $_db,
      $_db.businessPartners,
    ).filter((f) => f.partnerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _businessPartnersRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RegisteredDevicesTable, List<RegisteredDevice>>
  _registeredDevicesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.registeredDevices,
        aliasName: 'partners__id__registered_devices__partner_id',
      );

  $$RegisteredDevicesTableProcessedTableManager get registeredDevicesRefs {
    final manager = $$RegisteredDevicesTableTableManager(
      $_db,
      $_db.registeredDevices,
    ).filter((f) => f.partnerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _registeredDevicesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PartnersTableFilterComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> businessPartnersRefs(
    Expression<bool> Function($$BusinessPartnersTableFilterComposer f) f,
  ) {
    final $$BusinessPartnersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businessPartners,
      getReferencedColumn: (t) => t.partnerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessPartnersTableFilterComposer(
            $db: $db,
            $table: $db.businessPartners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> registeredDevicesRefs(
    Expression<bool> Function($$RegisteredDevicesTableFilterComposer f) f,
  ) {
    final $$RegisteredDevicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.registeredDevices,
      getReferencedColumn: (t) => t.partnerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RegisteredDevicesTableFilterComposer(
            $db: $db,
            $table: $db.registeredDevices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PartnersTableOrderingComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PartnersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PartnersTable> {
  $$PartnersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> businessPartnersRefs<T extends Object>(
    Expression<T> Function($$BusinessPartnersTableAnnotationComposer a) f,
  ) {
    final $$BusinessPartnersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.businessPartners,
      getReferencedColumn: (t) => t.partnerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessPartnersTableAnnotationComposer(
            $db: $db,
            $table: $db.businessPartners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> registeredDevicesRefs<T extends Object>(
    Expression<T> Function($$RegisteredDevicesTableAnnotationComposer a) f,
  ) {
    final $$RegisteredDevicesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.registeredDevices,
          getReferencedColumn: (t) => t.partnerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RegisteredDevicesTableAnnotationComposer(
                $db: $db,
                $table: $db.registeredDevices,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PartnersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PartnersTable,
          Partner,
          $$PartnersTableFilterComposer,
          $$PartnersTableOrderingComposer,
          $$PartnersTableAnnotationComposer,
          $$PartnersTableCreateCompanionBuilder,
          $$PartnersTableUpdateCompanionBuilder,
          (Partner, $$PartnersTableReferences),
          Partner,
          PrefetchHooks Function({
            bool businessPartnersRefs,
            bool registeredDevicesRefs,
          })
        > {
  $$PartnersTableTableManager(_$AppDatabase db, $PartnersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartnersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartnersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartnersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PartnersCompanion(
                id: id,
                name: name,
                phone: phone,
                email: email,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PartnersCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                email: email,
                notes: notes,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PartnersTable, Partner>(table),
                  $$PartnersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({businessPartnersRefs = false, registeredDevicesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (businessPartnersRefs) db.businessPartners,
                    if (registeredDevicesRefs) db.registeredDevices,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (businessPartnersRefs)
                        await $_getPrefetchedDataByColumns<
                          Partner,
                          $PartnersTable,
                          BusinessPartner,
                          $BusinessPartnersTable
                        >(
                          currentTable: table,
                          referencedTable: $$PartnersTableReferences
                              ._businessPartnersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartnersTableReferences(
                                db,
                                table,
                                p0,
                              ).businessPartnersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'partner_id',
                          typedResults: items,
                        ),
                      if (registeredDevicesRefs)
                        await $_getPrefetchedDataByColumns<
                          Partner,
                          $PartnersTable,
                          RegisteredDevice,
                          $RegisteredDevicesTable
                        >(
                          currentTable: table,
                          referencedTable: $$PartnersTableReferences
                              ._registeredDevicesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartnersTableReferences(
                                db,
                                table,
                                p0,
                              ).registeredDevicesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'partner_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PartnersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PartnersTable,
      Partner,
      $$PartnersTableFilterComposer,
      $$PartnersTableOrderingComposer,
      $$PartnersTableAnnotationComposer,
      $$PartnersTableCreateCompanionBuilder,
      $$PartnersTableUpdateCompanionBuilder,
      (Partner, $$PartnersTableReferences),
      Partner,
      PrefetchHooks Function({
        bool businessPartnersRefs,
        bool registeredDevicesRefs,
      })
    >;
typedef $$BusinessPartnersTableCreateCompanionBuilder =
    BusinessPartnersCompanion Function({
      Value<int> id,
      required int businessId,
      required int partnerId,
      required double sharePercentage,
      Value<DateTime> createdAt,
    });
typedef $$BusinessPartnersTableUpdateCompanionBuilder =
    BusinessPartnersCompanion Function({
      Value<int> id,
      Value<int> businessId,
      Value<int> partnerId,
      Value<double> sharePercentage,
      Value<DateTime> createdAt,
    });

final class $$BusinessPartnersTableReferences
    extends
        BaseReferences<_$AppDatabase, $BusinessPartnersTable, BusinessPartner> {
  $$BusinessPartnersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BusinessesTable _businessIdTable(_$AppDatabase db) => db.businesses
      .createAlias('business_partners__business_id__businesses__id');

  $$BusinessesTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<int>('business_id')!;

    final manager = $$BusinessesTableTableManager(
      $_db,
      $_db.businesses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PartnersTable _partnerIdTable(_$AppDatabase db) =>
      db.partners.createAlias('business_partners__partner_id__partners__id');

  $$PartnersTableProcessedTableManager get partnerId {
    final $_column = $_itemColumn<int>('partner_id')!;

    final manager = $$PartnersTableTableManager(
      $_db,
      $_db.partners,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partnerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$BusinessPartnersTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessPartnersTable> {
  $$BusinessPartnersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sharePercentage => $composableBuilder(
    column: $table.sharePercentage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessesTableFilterComposer get businessId {
    final $$BusinessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableFilterComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PartnersTableFilterComposer get partnerId {
    final $$PartnersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableFilterComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusinessPartnersTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessPartnersTable> {
  $$BusinessPartnersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sharePercentage => $composableBuilder(
    column: $table.sharePercentage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessesTableOrderingComposer get businessId {
    final $$BusinessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableOrderingComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PartnersTableOrderingComposer get partnerId {
    final $$PartnersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableOrderingComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusinessPartnersTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessPartnersTable> {
  $$BusinessPartnersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get sharePercentage => $composableBuilder(
    column: $table.sharePercentage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BusinessesTableAnnotationComposer get businessId {
    final $$BusinessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableAnnotationComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PartnersTableAnnotationComposer get partnerId {
    final $$PartnersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableAnnotationComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$BusinessPartnersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BusinessPartnersTable,
          BusinessPartner,
          $$BusinessPartnersTableFilterComposer,
          $$BusinessPartnersTableOrderingComposer,
          $$BusinessPartnersTableAnnotationComposer,
          $$BusinessPartnersTableCreateCompanionBuilder,
          $$BusinessPartnersTableUpdateCompanionBuilder,
          (BusinessPartner, $$BusinessPartnersTableReferences),
          BusinessPartner,
          PrefetchHooks Function({bool businessId, bool partnerId})
        > {
  $$BusinessPartnersTableTableManager(
    _$AppDatabase db,
    $BusinessPartnersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessPartnersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessPartnersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessPartnersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> businessId = const Value.absent(),
                Value<int> partnerId = const Value.absent(),
                Value<double> sharePercentage = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessPartnersCompanion(
                id: id,
                businessId: businessId,
                partnerId: partnerId,
                sharePercentage: sharePercentage,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int businessId,
                required int partnerId,
                required double sharePercentage,
                Value<DateTime> createdAt = const Value.absent(),
              }) => BusinessPartnersCompanion.insert(
                id: id,
                businessId: businessId,
                partnerId: partnerId,
                sharePercentage: sharePercentage,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$BusinessPartnersTable, BusinessPartner>(table),
                  $$BusinessPartnersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({businessId = false, partnerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (businessId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.businessId,
                        referencedTable: $$BusinessPartnersTableReferences
                            ._businessIdTable(db),
                        referencedColumn: $$BusinessPartnersTableReferences
                            ._businessIdTable(db)
                            .id,
                      ) as T;
                    }
                    if (partnerId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.partnerId,
                        referencedTable: $$BusinessPartnersTableReferences
                            ._partnerIdTable(db),
                        referencedColumn: $$BusinessPartnersTableReferences
                            ._partnerIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$BusinessPartnersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BusinessPartnersTable,
      BusinessPartner,
      $$BusinessPartnersTableFilterComposer,
      $$BusinessPartnersTableOrderingComposer,
      $$BusinessPartnersTableAnnotationComposer,
      $$BusinessPartnersTableCreateCompanionBuilder,
      $$BusinessPartnersTableUpdateCompanionBuilder,
      (BusinessPartner, $$BusinessPartnersTableReferences),
      BusinessPartner,
      PrefetchHooks Function({bool businessId, bool partnerId})
    >;
typedef $$FinancialTransactionsTableCreateCompanionBuilder =
    FinancialTransactionsCompanion Function({
      Value<int> id,
      required int businessId,
      required String transactionType,
      required String category,
      required double amount,
      required DateTime transactionDate,
      Value<String?> description,
      Value<bool> isReversed,
      Value<DateTime?> reversedAt,
      Value<String?> reversalReason,
      Value<DateTime> createdAt,
    });
typedef $$FinancialTransactionsTableUpdateCompanionBuilder =
    FinancialTransactionsCompanion Function({
      Value<int> id,
      Value<int> businessId,
      Value<String> transactionType,
      Value<String> category,
      Value<double> amount,
      Value<DateTime> transactionDate,
      Value<String?> description,
      Value<bool> isReversed,
      Value<DateTime?> reversedAt,
      Value<String?> reversalReason,
      Value<DateTime> createdAt,
    });

final class $$FinancialTransactionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $FinancialTransactionsTable,
          FinancialTransaction
        > {
  $$FinancialTransactionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BusinessesTable _businessIdTable(_$AppDatabase db) => db.businesses
      .createAlias('financial_transactions__business_id__businesses__id');

  $$BusinessesTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<int>('business_id')!;

    final manager = $$BusinessesTableTableManager(
      $_db,
      $_db.businesses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SocietySmsAccountingEntriesTable,
    List<SocietySmsAccountingEntry>
  >
  _societySmsAccountingEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.societySmsAccountingEntries,
        aliasName: 'financial_transactions__id__society_sms_accounting_entries__financial_transaction_id',
      );

  $$SocietySmsAccountingEntriesTableProcessedTableManager
  get societySmsAccountingEntriesRefs {
    final manager =
        $$SocietySmsAccountingEntriesTableTableManager(
          $_db,
          $_db.societySmsAccountingEntries,
        ).filter(
          (f) =>
              f.financialTransactionId.id.sqlEquals($_itemColumn<int>('id')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _societySmsAccountingEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FinancialTransactionsTableFilterComposer
    extends Composer<_$AppDatabase, $FinancialTransactionsTable> {
  $$FinancialTransactionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isReversed => $composableBuilder(
    column: $table.isReversed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get reversedAt => $composableBuilder(
    column: $table.reversedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessesTableFilterComposer get businessId {
    final $$BusinessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableFilterComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> societySmsAccountingEntriesRefs(
    Expression<bool> Function(
      $$SocietySmsAccountingEntriesTableFilterComposer f,
    )
    f,
  ) {
    final $$SocietySmsAccountingEntriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsAccountingEntries,
          getReferencedColumn: (t) => t.financialTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsAccountingEntriesTableFilterComposer(
                $db: $db,
                $table: $db.societySmsAccountingEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FinancialTransactionsTableOrderingComposer
    extends Composer<_$AppDatabase, $FinancialTransactionsTable> {
  $$FinancialTransactionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isReversed => $composableBuilder(
    column: $table.isReversed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get reversedAt => $composableBuilder(
    column: $table.reversedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessesTableOrderingComposer get businessId {
    final $$BusinessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableOrderingComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FinancialTransactionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FinancialTransactionsTable> {
  $$FinancialTransactionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get transactionType => $composableBuilder(
    column: $table.transactionType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isReversed => $composableBuilder(
    column: $table.isReversed,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get reversedAt => $composableBuilder(
    column: $table.reversedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get reversalReason => $composableBuilder(
    column: $table.reversalReason,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BusinessesTableAnnotationComposer get businessId {
    final $$BusinessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableAnnotationComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> societySmsAccountingEntriesRefs<T extends Object>(
    Expression<T> Function(
      $$SocietySmsAccountingEntriesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SocietySmsAccountingEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsAccountingEntries,
          getReferencedColumn: (t) => t.financialTransactionId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsAccountingEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.societySmsAccountingEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$FinancialTransactionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FinancialTransactionsTable,
          FinancialTransaction,
          $$FinancialTransactionsTableFilterComposer,
          $$FinancialTransactionsTableOrderingComposer,
          $$FinancialTransactionsTableAnnotationComposer,
          $$FinancialTransactionsTableCreateCompanionBuilder,
          $$FinancialTransactionsTableUpdateCompanionBuilder,
          (FinancialTransaction, $$FinancialTransactionsTableReferences),
          FinancialTransaction,
          PrefetchHooks Function({
            bool businessId,
            bool societySmsAccountingEntriesRefs,
          })
        > {
  $$FinancialTransactionsTableTableManager(
    _$AppDatabase db,
    $FinancialTransactionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FinancialTransactionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$FinancialTransactionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$FinancialTransactionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> businessId = const Value.absent(),
                Value<String> transactionType = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> transactionDate = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<bool> isReversed = const Value.absent(),
                Value<DateTime?> reversedAt = const Value.absent(),
                Value<String?> reversalReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FinancialTransactionsCompanion(
                id: id,
                businessId: businessId,
                transactionType: transactionType,
                category: category,
                amount: amount,
                transactionDate: transactionDate,
                description: description,
                isReversed: isReversed,
                reversedAt: reversedAt,
                reversalReason: reversalReason,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int businessId,
                required String transactionType,
                required String category,
                required double amount,
                required DateTime transactionDate,
                Value<String?> description = const Value.absent(),
                Value<bool> isReversed = const Value.absent(),
                Value<DateTime?> reversedAt = const Value.absent(),
                Value<String?> reversalReason = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => FinancialTransactionsCompanion.insert(
                id: id,
                businessId: businessId,
                transactionType: transactionType,
                category: category,
                amount: amount,
                transactionDate: transactionDate,
                description: description,
                isReversed: isReversed,
                reversedAt: reversedAt,
                reversalReason: reversalReason,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $FinancialTransactionsTable,
                    FinancialTransaction
                  >(table),
                  $$FinancialTransactionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({businessId = false, societySmsAccountingEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (societySmsAccountingEntriesRefs)
                      db.societySmsAccountingEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (businessId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.businessId,
                            referencedTable:
                                $$FinancialTransactionsTableReferences
                                    ._businessIdTable(db),
                            referencedColumn:
                                $$FinancialTransactionsTableReferences
                                    ._businessIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (societySmsAccountingEntriesRefs)
                        await $_getPrefetchedDataByColumns<
                          FinancialTransaction,
                          $FinancialTransactionsTable,
                          SocietySmsAccountingEntry,
                          $SocietySmsAccountingEntriesTable
                        >(
                          currentTable: table,
                          referencedTable:
                              $$FinancialTransactionsTableReferences
                                  ._societySmsAccountingEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FinancialTransactionsTableReferences(
                                db,
                                table,
                                p0,
                              ).societySmsAccountingEntriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'financial_transaction_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FinancialTransactionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FinancialTransactionsTable,
      FinancialTransaction,
      $$FinancialTransactionsTableFilterComposer,
      $$FinancialTransactionsTableOrderingComposer,
      $$FinancialTransactionsTableAnnotationComposer,
      $$FinancialTransactionsTableCreateCompanionBuilder,
      $$FinancialTransactionsTableUpdateCompanionBuilder,
      (FinancialTransaction, $$FinancialTransactionsTableReferences),
      FinancialTransaction,
      PrefetchHooks Function({
        bool businessId,
        bool societySmsAccountingEntriesRefs,
      })
    >;
typedef $$TransactionAuditLogsTableCreateCompanionBuilder =
    TransactionAuditLogsCompanion Function({
      Value<int> id,
      required int transactionId,
      required String action,
      Value<String?> details,
      Value<DateTime> createdAt,
    });
typedef $$TransactionAuditLogsTableUpdateCompanionBuilder =
    TransactionAuditLogsCompanion Function({
      Value<int> id,
      Value<int> transactionId,
      Value<String> action,
      Value<String?> details,
      Value<DateTime> createdAt,
    });

class $$TransactionAuditLogsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionAuditLogsTable> {
  $$TransactionAuditLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransactionAuditLogsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionAuditLogsTable> {
  $$TransactionAuditLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get action => $composableBuilder(
    column: $table.action,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get details => $composableBuilder(
    column: $table.details,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransactionAuditLogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionAuditLogsTable> {
  $$TransactionAuditLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transactionId => $composableBuilder(
    column: $table.transactionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransactionAuditLogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransactionAuditLogsTable,
          TransactionAuditLog,
          $$TransactionAuditLogsTableFilterComposer,
          $$TransactionAuditLogsTableOrderingComposer,
          $$TransactionAuditLogsTableAnnotationComposer,
          $$TransactionAuditLogsTableCreateCompanionBuilder,
          $$TransactionAuditLogsTableUpdateCompanionBuilder,
          (
            TransactionAuditLog,
            BaseReferences<
              _$AppDatabase,
              $TransactionAuditLogsTable,
              TransactionAuditLog
            >,
          ),
          TransactionAuditLog,
          PrefetchHooks Function()
        > {
  $$TransactionAuditLogsTableTableManager(
    _$AppDatabase db,
    $TransactionAuditLogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionAuditLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionAuditLogsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$TransactionAuditLogsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> transactionId = const Value.absent(),
                Value<String> action = const Value.absent(),
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionAuditLogsCompanion(
                id: id,
                transactionId: transactionId,
                action: action,
                details: details,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transactionId,
                required String action,
                Value<String?> details = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransactionAuditLogsCompanion.insert(
                id: id,
                transactionId: transactionId,
                action: action,
                details: details,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TransactionAuditLogsTable, TransactionAuditLog>(
                    table,
                  ),
                  BaseReferences<
                    _$AppDatabase,
                    $TransactionAuditLogsTable,
                    TransactionAuditLog
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransactionAuditLogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransactionAuditLogsTable,
      TransactionAuditLog,
      $$TransactionAuditLogsTableFilterComposer,
      $$TransactionAuditLogsTableOrderingComposer,
      $$TransactionAuditLogsTableAnnotationComposer,
      $$TransactionAuditLogsTableCreateCompanionBuilder,
      $$TransactionAuditLogsTableUpdateCompanionBuilder,
      (
        TransactionAuditLog,
        BaseReferences<
          _$AppDatabase,
          $TransactionAuditLogsTable,
          TransactionAuditLog
        >,
      ),
      TransactionAuditLog,
      PrefetchHooks Function()
    >;
typedef $$MilkSocietiesTableCreateCompanionBuilder =
    MilkSocietiesCompanion Function({
      Value<int> id,
      required int businessId,
      required String name,
      Value<String?> location,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$MilkSocietiesTableUpdateCompanionBuilder =
    MilkSocietiesCompanion Function({
      Value<int> id,
      Value<int> businessId,
      Value<String> name,
      Value<String?> location,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$MilkSocietiesTableReferences
    extends BaseReferences<_$AppDatabase, $MilkSocietiesTable, MilkSociety> {
  $$MilkSocietiesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $BusinessesTable _businessIdTable(_$AppDatabase db) =>
      db.businesses.createAlias('milk_societies__business_id__businesses__id');

  $$BusinessesTableProcessedTableManager get businessId {
    final $_column = $_itemColumn<int>('business_id')!;

    final manager = $$BusinessesTableTableManager(
      $_db,
      $_db.businesses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_businessIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SocietySendersTable, List<SocietySender>>
  _societySendersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.societySenders,
    aliasName: 'milk_societies__id__society_senders__society_id',
  );

  $$SocietySendersTableProcessedTableManager get societySendersRefs {
    final manager = $$SocietySendersTableTableManager(
      $_db,
      $_db.societySenders,
    ).filter((f) => f.societyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_societySendersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MilkProducersTable, List<MilkProducer>>
  _milkProducersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.milkProducers,
    aliasName: 'milk_societies__id__milk_producers__society_id',
  );

  $$MilkProducersTableProcessedTableManager get milkProducersRefs {
    final manager = $$MilkProducersTableTableManager(
      $_db,
      $_db.milkProducers,
    ).filter((f) => f.societyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_milkProducersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SocietySmsMessagesTable, List<SocietySmsMessage>>
  _societySmsMessagesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.societySmsMessages,
        aliasName: 'milk_societies__id__society_sms_messages__society_id',
      );

  $$SocietySmsMessagesTableProcessedTableManager get societySmsMessagesRefs {
    final manager = $$SocietySmsMessagesTableTableManager(
      $_db,
      $_db.societySmsMessages,
    ).filter((f) => f.societyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _societySmsMessagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MilkSocietiesTableFilterComposer
    extends Composer<_$AppDatabase, $MilkSocietiesTable> {
  $$MilkSocietiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$BusinessesTableFilterComposer get businessId {
    final $$BusinessesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableFilterComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> societySendersRefs(
    Expression<bool> Function($$SocietySendersTableFilterComposer f) f,
  ) {
    final $$SocietySendersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.societySenders,
      getReferencedColumn: (t) => t.societyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySendersTableFilterComposer(
            $db: $db,
            $table: $db.societySenders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> milkProducersRefs(
    Expression<bool> Function($$MilkProducersTableFilterComposer f) f,
  ) {
    final $$MilkProducersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.milkProducers,
      getReferencedColumn: (t) => t.societyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkProducersTableFilterComposer(
            $db: $db,
            $table: $db.milkProducers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> societySmsMessagesRefs(
    Expression<bool> Function($$SocietySmsMessagesTableFilterComposer f) f,
  ) {
    final $$SocietySmsMessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.societySmsMessages,
      getReferencedColumn: (t) => t.societyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySmsMessagesTableFilterComposer(
            $db: $db,
            $table: $db.societySmsMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MilkSocietiesTableOrderingComposer
    extends Composer<_$AppDatabase, $MilkSocietiesTable> {
  $$MilkSocietiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$BusinessesTableOrderingComposer get businessId {
    final $$BusinessesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableOrderingComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MilkSocietiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilkSocietiesTable> {
  $$MilkSocietiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$BusinessesTableAnnotationComposer get businessId {
    final $$BusinessesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.businessId,
      referencedTable: $db.businesses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BusinessesTableAnnotationComposer(
            $db: $db,
            $table: $db.businesses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> societySendersRefs<T extends Object>(
    Expression<T> Function($$SocietySendersTableAnnotationComposer a) f,
  ) {
    final $$SocietySendersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.societySenders,
      getReferencedColumn: (t) => t.societyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySendersTableAnnotationComposer(
            $db: $db,
            $table: $db.societySenders,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> milkProducersRefs<T extends Object>(
    Expression<T> Function($$MilkProducersTableAnnotationComposer a) f,
  ) {
    final $$MilkProducersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.milkProducers,
      getReferencedColumn: (t) => t.societyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkProducersTableAnnotationComposer(
            $db: $db,
            $table: $db.milkProducers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> societySmsMessagesRefs<T extends Object>(
    Expression<T> Function($$SocietySmsMessagesTableAnnotationComposer a) f,
  ) {
    final $$SocietySmsMessagesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsMessages,
          getReferencedColumn: (t) => t.societyId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsMessagesTableAnnotationComposer(
                $db: $db,
                $table: $db.societySmsMessages,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilkSocietiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilkSocietiesTable,
          MilkSociety,
          $$MilkSocietiesTableFilterComposer,
          $$MilkSocietiesTableOrderingComposer,
          $$MilkSocietiesTableAnnotationComposer,
          $$MilkSocietiesTableCreateCompanionBuilder,
          $$MilkSocietiesTableUpdateCompanionBuilder,
          (MilkSociety, $$MilkSocietiesTableReferences),
          MilkSociety,
          PrefetchHooks Function({
            bool businessId,
            bool societySendersRefs,
            bool milkProducersRefs,
            bool societySmsMessagesRefs,
          })
        > {
  $$MilkSocietiesTableTableManager(_$AppDatabase db, $MilkSocietiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilkSocietiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilkSocietiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilkSocietiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> businessId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MilkSocietiesCompanion(
                id: id,
                businessId: businessId,
                name: name,
                location: location,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int businessId,
                required String name,
                Value<String?> location = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MilkSocietiesCompanion.insert(
                id: id,
                businessId: businessId,
                name: name,
                location: location,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MilkSocietiesTable, MilkSociety>(table),
                  $$MilkSocietiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                businessId = false,
                societySendersRefs = false,
                milkProducersRefs = false,
                societySmsMessagesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (societySendersRefs) db.societySenders,
                    if (milkProducersRefs) db.milkProducers,
                    if (societySmsMessagesRefs) db.societySmsMessages,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (businessId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.businessId,
                            referencedTable: $$MilkSocietiesTableReferences
                                ._businessIdTable(db),
                            referencedColumn: $$MilkSocietiesTableReferences
                                ._businessIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (societySendersRefs)
                        await $_getPrefetchedDataByColumns<
                          MilkSociety,
                          $MilkSocietiesTable,
                          SocietySender,
                          $SocietySendersTable
                        >(
                          currentTable: table,
                          referencedTable: $$MilkSocietiesTableReferences
                              ._societySendersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilkSocietiesTableReferences(
                                db,
                                table,
                                p0,
                              ).societySendersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'society_id',
                          typedResults: items,
                        ),
                      if (milkProducersRefs)
                        await $_getPrefetchedDataByColumns<
                          MilkSociety,
                          $MilkSocietiesTable,
                          MilkProducer,
                          $MilkProducersTable
                        >(
                          currentTable: table,
                          referencedTable: $$MilkSocietiesTableReferences
                              ._milkProducersRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilkSocietiesTableReferences(
                                db,
                                table,
                                p0,
                              ).milkProducersRefs,
                          currentColumn: 'id',
                          referencedColumn: 'society_id',
                          typedResults: items,
                        ),
                      if (societySmsMessagesRefs)
                        await $_getPrefetchedDataByColumns<
                          MilkSociety,
                          $MilkSocietiesTable,
                          SocietySmsMessage,
                          $SocietySmsMessagesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MilkSocietiesTableReferences
                              ._societySmsMessagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilkSocietiesTableReferences(
                                db,
                                table,
                                p0,
                              ).societySmsMessagesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'society_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MilkSocietiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilkSocietiesTable,
      MilkSociety,
      $$MilkSocietiesTableFilterComposer,
      $$MilkSocietiesTableOrderingComposer,
      $$MilkSocietiesTableAnnotationComposer,
      $$MilkSocietiesTableCreateCompanionBuilder,
      $$MilkSocietiesTableUpdateCompanionBuilder,
      (MilkSociety, $$MilkSocietiesTableReferences),
      MilkSociety,
      PrefetchHooks Function({
        bool businessId,
        bool societySendersRefs,
        bool milkProducersRefs,
        bool societySmsMessagesRefs,
      })
    >;
typedef $$SocietySendersTableCreateCompanionBuilder =
    SocietySendersCompanion Function({
      Value<int> id,
      required int societyId,
      required String senderIdentifier,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$SocietySendersTableUpdateCompanionBuilder =
    SocietySendersCompanion Function({
      Value<int> id,
      Value<int> societyId,
      Value<String> senderIdentifier,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$SocietySendersTableReferences
    extends BaseReferences<_$AppDatabase, $SocietySendersTable, SocietySender> {
  $$SocietySendersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilkSocietiesTable _societyIdTable(_$AppDatabase db) => db
      .milkSocieties
      .createAlias('society_senders__society_id__milk_societies__id');

  $$MilkSocietiesTableProcessedTableManager get societyId {
    final $_column = $_itemColumn<int>('society_id')!;

    final manager = $$MilkSocietiesTableTableManager(
      $_db,
      $_db.milkSocieties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_societyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SocietySendersTableFilterComposer
    extends Composer<_$AppDatabase, $SocietySendersTable> {
  $$SocietySendersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get senderIdentifier => $composableBuilder(
    column: $table.senderIdentifier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MilkSocietiesTableFilterComposer get societyId {
    final $$MilkSocietiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableFilterComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SocietySendersTableOrderingComposer
    extends Composer<_$AppDatabase, $SocietySendersTable> {
  $$SocietySendersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get senderIdentifier => $composableBuilder(
    column: $table.senderIdentifier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilkSocietiesTableOrderingComposer get societyId {
    final $$MilkSocietiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableOrderingComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SocietySendersTableAnnotationComposer
    extends Composer<_$AppDatabase, $SocietySendersTable> {
  $$SocietySendersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get senderIdentifier => $composableBuilder(
    column: $table.senderIdentifier,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MilkSocietiesTableAnnotationComposer get societyId {
    final $$MilkSocietiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableAnnotationComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SocietySendersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SocietySendersTable,
          SocietySender,
          $$SocietySendersTableFilterComposer,
          $$SocietySendersTableOrderingComposer,
          $$SocietySendersTableAnnotationComposer,
          $$SocietySendersTableCreateCompanionBuilder,
          $$SocietySendersTableUpdateCompanionBuilder,
          (SocietySender, $$SocietySendersTableReferences),
          SocietySender,
          PrefetchHooks Function({bool societyId})
        > {
  $$SocietySendersTableTableManager(
    _$AppDatabase db,
    $SocietySendersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SocietySendersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SocietySendersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SocietySendersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> societyId = const Value.absent(),
                Value<String> senderIdentifier = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySendersCompanion(
                id: id,
                societyId: societyId,
                senderIdentifier: senderIdentifier,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int societyId,
                required String senderIdentifier,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySendersCompanion.insert(
                id: id,
                societyId: societyId,
                senderIdentifier: senderIdentifier,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SocietySendersTable, SocietySender>(table),
                  $$SocietySendersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({societyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (societyId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.societyId,
                        referencedTable: $$SocietySendersTableReferences
                            ._societyIdTable(db),
                        referencedColumn: $$SocietySendersTableReferences
                            ._societyIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SocietySendersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SocietySendersTable,
      SocietySender,
      $$SocietySendersTableFilterComposer,
      $$SocietySendersTableOrderingComposer,
      $$SocietySendersTableAnnotationComposer,
      $$SocietySendersTableCreateCompanionBuilder,
      $$SocietySendersTableUpdateCompanionBuilder,
      (SocietySender, $$SocietySendersTableReferences),
      SocietySender,
      PrefetchHooks Function({bool societyId})
    >;
typedef $$MilkProducersTableCreateCompanionBuilder =
    MilkProducersCompanion Function({
      Value<int> id,
      required int societyId,
      required String producerNumber,
      required String producerName,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$MilkProducersTableUpdateCompanionBuilder =
    MilkProducersCompanion Function({
      Value<int> id,
      Value<int> societyId,
      Value<String> producerNumber,
      Value<String> producerName,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$MilkProducersTableReferences
    extends BaseReferences<_$AppDatabase, $MilkProducersTable, MilkProducer> {
  $$MilkProducersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilkSocietiesTable _societyIdTable(_$AppDatabase db) => db
      .milkSocieties
      .createAlias('milk_producers__society_id__milk_societies__id');

  $$MilkSocietiesTableProcessedTableManager get societyId {
    final $_column = $_itemColumn<int>('society_id')!;

    final manager = $$MilkSocietiesTableTableManager(
      $_db,
      $_db.milkSocieties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_societyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$SocietySmsMessagesTable, List<SocietySmsMessage>>
  _societySmsMessagesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.societySmsMessages,
        aliasName: 'milk_producers__id__society_sms_messages__producer_id',
      );

  $$SocietySmsMessagesTableProcessedTableManager get societySmsMessagesRefs {
    final manager = $$SocietySmsMessagesTableTableManager(
      $_db,
      $_db.societySmsMessages,
    ).filter((f) => f.producerId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _societySmsMessagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MilkProducersTableFilterComposer
    extends Composer<_$AppDatabase, $MilkProducersTable> {
  $$MilkProducersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get producerNumber => $composableBuilder(
    column: $table.producerNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MilkSocietiesTableFilterComposer get societyId {
    final $$MilkSocietiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableFilterComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> societySmsMessagesRefs(
    Expression<bool> Function($$SocietySmsMessagesTableFilterComposer f) f,
  ) {
    final $$SocietySmsMessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.societySmsMessages,
      getReferencedColumn: (t) => t.producerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySmsMessagesTableFilterComposer(
            $db: $db,
            $table: $db.societySmsMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MilkProducersTableOrderingComposer
    extends Composer<_$AppDatabase, $MilkProducersTable> {
  $$MilkProducersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get producerNumber => $composableBuilder(
    column: $table.producerNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilkSocietiesTableOrderingComposer get societyId {
    final $$MilkSocietiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableOrderingComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MilkProducersTableAnnotationComposer
    extends Composer<_$AppDatabase, $MilkProducersTable> {
  $$MilkProducersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get producerNumber => $composableBuilder(
    column: $table.producerNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get producerName => $composableBuilder(
    column: $table.producerName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MilkSocietiesTableAnnotationComposer get societyId {
    final $$MilkSocietiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableAnnotationComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> societySmsMessagesRefs<T extends Object>(
    Expression<T> Function($$SocietySmsMessagesTableAnnotationComposer a) f,
  ) {
    final $$SocietySmsMessagesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsMessages,
          getReferencedColumn: (t) => t.producerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsMessagesTableAnnotationComposer(
                $db: $db,
                $table: $db.societySmsMessages,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$MilkProducersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MilkProducersTable,
          MilkProducer,
          $$MilkProducersTableFilterComposer,
          $$MilkProducersTableOrderingComposer,
          $$MilkProducersTableAnnotationComposer,
          $$MilkProducersTableCreateCompanionBuilder,
          $$MilkProducersTableUpdateCompanionBuilder,
          (MilkProducer, $$MilkProducersTableReferences),
          MilkProducer,
          PrefetchHooks Function({bool societyId, bool societySmsMessagesRefs})
        > {
  $$MilkProducersTableTableManager(_$AppDatabase db, $MilkProducersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MilkProducersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MilkProducersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MilkProducersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> societyId = const Value.absent(),
                Value<String> producerNumber = const Value.absent(),
                Value<String> producerName = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MilkProducersCompanion(
                id: id,
                societyId: societyId,
                producerNumber: producerNumber,
                producerName: producerName,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int societyId,
                required String producerNumber,
                required String producerName,
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => MilkProducersCompanion.insert(
                id: id,
                societyId: societyId,
                producerNumber: producerNumber,
                producerName: producerName,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$MilkProducersTable, MilkProducer>(table),
                  $$MilkProducersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({societyId = false, societySmsMessagesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (societySmsMessagesRefs) db.societySmsMessages,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (societyId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.societyId,
                            referencedTable: $$MilkProducersTableReferences
                                ._societyIdTable(db),
                            referencedColumn: $$MilkProducersTableReferences
                                ._societyIdTable(db)
                                .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (societySmsMessagesRefs)
                        await $_getPrefetchedDataByColumns<
                          MilkProducer,
                          $MilkProducersTable,
                          SocietySmsMessage,
                          $SocietySmsMessagesTable
                        >(
                          currentTable: table,
                          referencedTable: $$MilkProducersTableReferences
                              ._societySmsMessagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$MilkProducersTableReferences(
                                db,
                                table,
                                p0,
                              ).societySmsMessagesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'producer_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$MilkProducersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MilkProducersTable,
      MilkProducer,
      $$MilkProducersTableFilterComposer,
      $$MilkProducersTableOrderingComposer,
      $$MilkProducersTableAnnotationComposer,
      $$MilkProducersTableCreateCompanionBuilder,
      $$MilkProducersTableUpdateCompanionBuilder,
      (MilkProducer, $$MilkProducersTableReferences),
      MilkProducer,
      PrefetchHooks Function({bool societyId, bool societySmsMessagesRefs})
    >;
typedef $$RegisteredDevicesTableCreateCompanionBuilder =
    RegisteredDevicesCompanion Function({
      Value<int> id,
      required String deviceId,
      Value<int?> partnerId,
      required String deviceName,
      required String platform,
      Value<DateTime?> lastSeenAt,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });
typedef $$RegisteredDevicesTableUpdateCompanionBuilder =
    RegisteredDevicesCompanion Function({
      Value<int> id,
      Value<String> deviceId,
      Value<int?> partnerId,
      Value<String> deviceName,
      Value<String> platform,
      Value<DateTime?> lastSeenAt,
      Value<bool> isActive,
      Value<DateTime> createdAt,
    });

final class $$RegisteredDevicesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RegisteredDevicesTable,
          RegisteredDevice
        > {
  $$RegisteredDevicesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartnersTable _partnerIdTable(_$AppDatabase db) =>
      db.partners.createAlias('registered_devices__partner_id__partners__id');

  $$PartnersTableProcessedTableManager? get partnerId {
    final $_column = $_itemColumn<int>('partner_id');
    if ($_column == null) return null;
    final manager = $$PartnersTableTableManager(
      $_db,
      $_db.partners,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partnerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RegisteredDevicesTableFilterComposer
    extends Composer<_$AppDatabase, $RegisteredDevicesTable> {
  $$RegisteredDevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PartnersTableFilterComposer get partnerId {
    final $$PartnersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableFilterComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RegisteredDevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $RegisteredDevicesTable> {
  $$RegisteredDevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceId => $composableBuilder(
    column: $table.deviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get platform => $composableBuilder(
    column: $table.platform,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PartnersTableOrderingComposer get partnerId {
    final $$PartnersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableOrderingComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RegisteredDevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RegisteredDevicesTable> {
  $$RegisteredDevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get deviceId =>
      $composableBuilder(column: $table.deviceId, builder: (column) => column);

  GeneratedColumn<String> get deviceName => $composableBuilder(
    column: $table.deviceName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get platform =>
      $composableBuilder(column: $table.platform, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSeenAt => $composableBuilder(
    column: $table.lastSeenAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PartnersTableAnnotationComposer get partnerId {
    final $$PartnersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partnerId,
      referencedTable: $db.partners,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartnersTableAnnotationComposer(
            $db: $db,
            $table: $db.partners,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RegisteredDevicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RegisteredDevicesTable,
          RegisteredDevice,
          $$RegisteredDevicesTableFilterComposer,
          $$RegisteredDevicesTableOrderingComposer,
          $$RegisteredDevicesTableAnnotationComposer,
          $$RegisteredDevicesTableCreateCompanionBuilder,
          $$RegisteredDevicesTableUpdateCompanionBuilder,
          (RegisteredDevice, $$RegisteredDevicesTableReferences),
          RegisteredDevice,
          PrefetchHooks Function({bool partnerId})
        > {
  $$RegisteredDevicesTableTableManager(
    _$AppDatabase db,
    $RegisteredDevicesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RegisteredDevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RegisteredDevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RegisteredDevicesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> deviceId = const Value.absent(),
                Value<int?> partnerId = const Value.absent(),
                Value<String> deviceName = const Value.absent(),
                Value<String> platform = const Value.absent(),
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RegisteredDevicesCompanion(
                id: id,
                deviceId: deviceId,
                partnerId: partnerId,
                deviceName: deviceName,
                platform: platform,
                lastSeenAt: lastSeenAt,
                isActive: isActive,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String deviceId,
                Value<int?> partnerId = const Value.absent(),
                required String deviceName,
                required String platform,
                Value<DateTime?> lastSeenAt = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RegisteredDevicesCompanion.insert(
                id: id,
                deviceId: deviceId,
                partnerId: partnerId,
                deviceName: deviceName,
                platform: platform,
                lastSeenAt: lastSeenAt,
                isActive: isActive,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$RegisteredDevicesTable, RegisteredDevice>(table),
                  $$RegisteredDevicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({partnerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (partnerId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.partnerId,
                        referencedTable: $$RegisteredDevicesTableReferences
                            ._partnerIdTable(db),
                        referencedColumn: $$RegisteredDevicesTableReferences
                            ._partnerIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RegisteredDevicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RegisteredDevicesTable,
      RegisteredDevice,
      $$RegisteredDevicesTableFilterComposer,
      $$RegisteredDevicesTableOrderingComposer,
      $$RegisteredDevicesTableAnnotationComposer,
      $$RegisteredDevicesTableCreateCompanionBuilder,
      $$RegisteredDevicesTableUpdateCompanionBuilder,
      (RegisteredDevice, $$RegisteredDevicesTableReferences),
      RegisteredDevice,
      PrefetchHooks Function({bool partnerId})
    >;
typedef $$SocietySmsMessagesTableCreateCompanionBuilder =
    SocietySmsMessagesCompanion Function({
      Value<int> id,
      Value<int?> societyId,
      Value<int?> producerId,
      required String sender,
      required String messageBody,
      required DateTime receivedAt,
      Value<String?> sourceDeviceId,
      required String messageFingerprint,
      Value<String> processingStatus,
      Value<String?> detectedType,
      Value<String?> processingError,
      Value<DateTime?> processedAt,
      Value<DateTime> createdAt,
    });
typedef $$SocietySmsMessagesTableUpdateCompanionBuilder =
    SocietySmsMessagesCompanion Function({
      Value<int> id,
      Value<int?> societyId,
      Value<int?> producerId,
      Value<String> sender,
      Value<String> messageBody,
      Value<DateTime> receivedAt,
      Value<String?> sourceDeviceId,
      Value<String> messageFingerprint,
      Value<String> processingStatus,
      Value<String?> detectedType,
      Value<String?> processingError,
      Value<DateTime?> processedAt,
      Value<DateTime> createdAt,
    });

final class $$SocietySmsMessagesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SocietySmsMessagesTable,
          SocietySmsMessage
        > {
  $$SocietySmsMessagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $MilkSocietiesTable _societyIdTable(_$AppDatabase db) => db
      .milkSocieties
      .createAlias('society_sms_messages__society_id__milk_societies__id');

  $$MilkSocietiesTableProcessedTableManager? get societyId {
    final $_column = $_itemColumn<int>('society_id');
    if ($_column == null) return null;
    final manager = $$MilkSocietiesTableTableManager(
      $_db,
      $_db.milkSocieties,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_societyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $MilkProducersTable _producerIdTable(_$AppDatabase db) => db
      .milkProducers
      .createAlias('society_sms_messages__producer_id__milk_producers__id');

  $$MilkProducersTableProcessedTableManager? get producerId {
    final $_column = $_itemColumn<int>('producer_id');
    if ($_column == null) return null;
    final manager = $$MilkProducersTableTableManager(
      $_db,
      $_db.milkProducers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_producerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $SocietySmsAccountingEntriesTable,
    List<SocietySmsAccountingEntry>
  >
  _societySmsAccountingEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.societySmsAccountingEntries,
        aliasName: 'society_sms_messages__id__society_sms_accounting_entries__sms_message_id',
      );

  $$SocietySmsAccountingEntriesTableProcessedTableManager
  get societySmsAccountingEntriesRefs {
    final manager = $$SocietySmsAccountingEntriesTableTableManager(
      $_db,
      $_db.societySmsAccountingEntries,
    ).filter((f) => f.smsMessageId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _societySmsAccountingEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SocietySmsMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $SocietySmsMessagesTable> {
  $$SocietySmsMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sender => $composableBuilder(
    column: $table.sender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageBody => $composableBuilder(
    column: $table.messageBody,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceDeviceId => $composableBuilder(
    column: $table.sourceDeviceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get messageFingerprint => $composableBuilder(
    column: $table.messageFingerprint,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get detectedType => $composableBuilder(
    column: $table.detectedType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get processingError => $composableBuilder(
    column: $table.processingError,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$MilkSocietiesTableFilterComposer get societyId {
    final $$MilkSocietiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableFilterComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MilkProducersTableFilterComposer get producerId {
    final $$MilkProducersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.producerId,
      referencedTable: $db.milkProducers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkProducersTableFilterComposer(
            $db: $db,
            $table: $db.milkProducers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> societySmsAccountingEntriesRefs(
    Expression<bool> Function(
      $$SocietySmsAccountingEntriesTableFilterComposer f,
    )
    f,
  ) {
    final $$SocietySmsAccountingEntriesTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsAccountingEntries,
          getReferencedColumn: (t) => t.smsMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsAccountingEntriesTableFilterComposer(
                $db: $db,
                $table: $db.societySmsAccountingEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SocietySmsMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $SocietySmsMessagesTable> {
  $$SocietySmsMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sender => $composableBuilder(
    column: $table.sender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageBody => $composableBuilder(
    column: $table.messageBody,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceDeviceId => $composableBuilder(
    column: $table.sourceDeviceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get messageFingerprint => $composableBuilder(
    column: $table.messageFingerprint,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get detectedType => $composableBuilder(
    column: $table.detectedType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get processingError => $composableBuilder(
    column: $table.processingError,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$MilkSocietiesTableOrderingComposer get societyId {
    final $$MilkSocietiesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableOrderingComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MilkProducersTableOrderingComposer get producerId {
    final $$MilkProducersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.producerId,
      referencedTable: $db.milkProducers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkProducersTableOrderingComposer(
            $db: $db,
            $table: $db.milkProducers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SocietySmsMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SocietySmsMessagesTable> {
  $$SocietySmsMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sender =>
      $composableBuilder(column: $table.sender, builder: (column) => column);

  GeneratedColumn<String> get messageBody => $composableBuilder(
    column: $table.messageBody,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sourceDeviceId => $composableBuilder(
    column: $table.sourceDeviceId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get messageFingerprint => $composableBuilder(
    column: $table.messageFingerprint,
    builder: (column) => column,
  );

  GeneratedColumn<String> get processingStatus => $composableBuilder(
    column: $table.processingStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get detectedType => $composableBuilder(
    column: $table.detectedType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get processingError => $composableBuilder(
    column: $table.processingError,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get processedAt => $composableBuilder(
    column: $table.processedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$MilkSocietiesTableAnnotationComposer get societyId {
    final $$MilkSocietiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.societyId,
      referencedTable: $db.milkSocieties,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkSocietiesTableAnnotationComposer(
            $db: $db,
            $table: $db.milkSocieties,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$MilkProducersTableAnnotationComposer get producerId {
    final $$MilkProducersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.producerId,
      referencedTable: $db.milkProducers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MilkProducersTableAnnotationComposer(
            $db: $db,
            $table: $db.milkProducers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> societySmsAccountingEntriesRefs<T extends Object>(
    Expression<T> Function(
      $$SocietySmsAccountingEntriesTableAnnotationComposer a,
    )
    f,
  ) {
    final $$SocietySmsAccountingEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.societySmsAccountingEntries,
          getReferencedColumn: (t) => t.smsMessageId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsAccountingEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.societySmsAccountingEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SocietySmsMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SocietySmsMessagesTable,
          SocietySmsMessage,
          $$SocietySmsMessagesTableFilterComposer,
          $$SocietySmsMessagesTableOrderingComposer,
          $$SocietySmsMessagesTableAnnotationComposer,
          $$SocietySmsMessagesTableCreateCompanionBuilder,
          $$SocietySmsMessagesTableUpdateCompanionBuilder,
          (SocietySmsMessage, $$SocietySmsMessagesTableReferences),
          SocietySmsMessage,
          PrefetchHooks Function({
            bool societyId,
            bool producerId,
            bool societySmsAccountingEntriesRefs,
          })
        > {
  $$SocietySmsMessagesTableTableManager(
    _$AppDatabase db,
    $SocietySmsMessagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SocietySmsMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SocietySmsMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SocietySmsMessagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> societyId = const Value.absent(),
                Value<int?> producerId = const Value.absent(),
                Value<String> sender = const Value.absent(),
                Value<String> messageBody = const Value.absent(),
                Value<DateTime> receivedAt = const Value.absent(),
                Value<String?> sourceDeviceId = const Value.absent(),
                Value<String> messageFingerprint = const Value.absent(),
                Value<String> processingStatus = const Value.absent(),
                Value<String?> detectedType = const Value.absent(),
                Value<String?> processingError = const Value.absent(),
                Value<DateTime?> processedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySmsMessagesCompanion(
                id: id,
                societyId: societyId,
                producerId: producerId,
                sender: sender,
                messageBody: messageBody,
                receivedAt: receivedAt,
                sourceDeviceId: sourceDeviceId,
                messageFingerprint: messageFingerprint,
                processingStatus: processingStatus,
                detectedType: detectedType,
                processingError: processingError,
                processedAt: processedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> societyId = const Value.absent(),
                Value<int?> producerId = const Value.absent(),
                required String sender,
                required String messageBody,
                required DateTime receivedAt,
                Value<String?> sourceDeviceId = const Value.absent(),
                required String messageFingerprint,
                Value<String> processingStatus = const Value.absent(),
                Value<String?> detectedType = const Value.absent(),
                Value<String?> processingError = const Value.absent(),
                Value<DateTime?> processedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySmsMessagesCompanion.insert(
                id: id,
                societyId: societyId,
                producerId: producerId,
                sender: sender,
                messageBody: messageBody,
                receivedAt: receivedAt,
                sourceDeviceId: sourceDeviceId,
                messageFingerprint: messageFingerprint,
                processingStatus: processingStatus,
                detectedType: detectedType,
                processingError: processingError,
                processedAt: processedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SocietySmsMessagesTable, SocietySmsMessage>(
                    table,
                  ),
                  $$SocietySmsMessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                societyId = false,
                producerId = false,
                societySmsAccountingEntriesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (societySmsAccountingEntriesRefs)
                      db.societySmsAccountingEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (societyId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.societyId,
                            referencedTable: $$SocietySmsMessagesTableReferences
                                ._societyIdTable(db),
                            referencedColumn:
                                $$SocietySmsMessagesTableReferences
                                    ._societyIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (producerId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.producerId,
                            referencedTable: $$SocietySmsMessagesTableReferences
                                ._producerIdTable(db),
                            referencedColumn:
                                $$SocietySmsMessagesTableReferences
                                    ._producerIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (societySmsAccountingEntriesRefs)
                        await $_getPrefetchedDataByColumns<
                          SocietySmsMessage,
                          $SocietySmsMessagesTable,
                          SocietySmsAccountingEntry,
                          $SocietySmsAccountingEntriesTable
                        >(
                          currentTable: table,
                          referencedTable: $$SocietySmsMessagesTableReferences
                              ._societySmsAccountingEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$SocietySmsMessagesTableReferences(
                                db,
                                table,
                                p0,
                              ).societySmsAccountingEntriesRefs,
                          currentColumn: 'id',
                          referencedColumn: 'sms_message_id',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$SocietySmsMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SocietySmsMessagesTable,
      SocietySmsMessage,
      $$SocietySmsMessagesTableFilterComposer,
      $$SocietySmsMessagesTableOrderingComposer,
      $$SocietySmsMessagesTableAnnotationComposer,
      $$SocietySmsMessagesTableCreateCompanionBuilder,
      $$SocietySmsMessagesTableUpdateCompanionBuilder,
      (SocietySmsMessage, $$SocietySmsMessagesTableReferences),
      SocietySmsMessage,
      PrefetchHooks Function({
        bool societyId,
        bool producerId,
        bool societySmsAccountingEntriesRefs,
      })
    >;
typedef $$SocietySmsAccountingEntriesTableCreateCompanionBuilder =
    SocietySmsAccountingEntriesCompanion Function({
      Value<int> id,
      required int smsMessageId,
      Value<int?> financialTransactionId,
      required String entryType,
      required double amount,
      required DateTime transactionDate,
      Value<String?> bankName,
      Value<DateTime> createdAt,
    });
typedef $$SocietySmsAccountingEntriesTableUpdateCompanionBuilder =
    SocietySmsAccountingEntriesCompanion Function({
      Value<int> id,
      Value<int> smsMessageId,
      Value<int?> financialTransactionId,
      Value<String> entryType,
      Value<double> amount,
      Value<DateTime> transactionDate,
      Value<String?> bankName,
      Value<DateTime> createdAt,
    });

final class $$SocietySmsAccountingEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SocietySmsAccountingEntriesTable,
          SocietySmsAccountingEntry
        > {
  $$SocietySmsAccountingEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SocietySmsMessagesTable _smsMessageIdTable(
    _$AppDatabase db,
  ) => db.societySmsMessages.createAlias(
    'society_sms_accounting_entries__sms_message_id__society_sms_messages__id',
  );

  $$SocietySmsMessagesTableProcessedTableManager get smsMessageId {
    final $_column = $_itemColumn<int>('sms_message_id')!;

    final manager = $$SocietySmsMessagesTableTableManager(
      $_db,
      $_db.societySmsMessages,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_smsMessageIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $FinancialTransactionsTable _financialTransactionIdTable(
    _$AppDatabase db,
  ) => db.financialTransactions.createAlias(
    'society_sms_accounting_entries__financial_transaction_id__financial_transactions__id',
  );

  $$FinancialTransactionsTableProcessedTableManager?
  get financialTransactionId {
    final $_column = $_itemColumn<int>('financial_transaction_id');
    if ($_column == null) return null;
    final manager = $$FinancialTransactionsTableTableManager(
      $_db,
      $_db.financialTransactions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(
      _financialTransactionIdTable($_db),
    );
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SocietySmsAccountingEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $SocietySmsAccountingEntriesTable> {
  $$SocietySmsAccountingEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get entryType => $composableBuilder(
    column: $table.entryType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SocietySmsMessagesTableFilterComposer get smsMessageId {
    final $$SocietySmsMessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.smsMessageId,
      referencedTable: $db.societySmsMessages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySmsMessagesTableFilterComposer(
            $db: $db,
            $table: $db.societySmsMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FinancialTransactionsTableFilterComposer get financialTransactionId {
    final $$FinancialTransactionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.financialTransactionId,
          referencedTable: $db.financialTransactions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FinancialTransactionsTableFilterComposer(
                $db: $db,
                $table: $db.financialTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SocietySmsAccountingEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $SocietySmsAccountingEntriesTable> {
  $$SocietySmsAccountingEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get entryType => $composableBuilder(
    column: $table.entryType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bankName => $composableBuilder(
    column: $table.bankName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SocietySmsMessagesTableOrderingComposer get smsMessageId {
    final $$SocietySmsMessagesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.smsMessageId,
      referencedTable: $db.societySmsMessages,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SocietySmsMessagesTableOrderingComposer(
            $db: $db,
            $table: $db.societySmsMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$FinancialTransactionsTableOrderingComposer get financialTransactionId {
    final $$FinancialTransactionsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.financialTransactionId,
          referencedTable: $db.financialTransactions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FinancialTransactionsTableOrderingComposer(
                $db: $db,
                $table: $db.financialTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SocietySmsAccountingEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SocietySmsAccountingEntriesTable> {
  $$SocietySmsAccountingEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entryType =>
      $composableBuilder(column: $table.entryType, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
    column: $table.transactionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bankName =>
      $composableBuilder(column: $table.bankName, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$SocietySmsMessagesTableAnnotationComposer get smsMessageId {
    final $$SocietySmsMessagesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.smsMessageId,
          referencedTable: $db.societySmsMessages,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SocietySmsMessagesTableAnnotationComposer(
                $db: $db,
                $table: $db.societySmsMessages,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$FinancialTransactionsTableAnnotationComposer get financialTransactionId {
    final $$FinancialTransactionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.financialTransactionId,
          referencedTable: $db.financialTransactions,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$FinancialTransactionsTableAnnotationComposer(
                $db: $db,
                $table: $db.financialTransactions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$SocietySmsAccountingEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SocietySmsAccountingEntriesTable,
          SocietySmsAccountingEntry,
          $$SocietySmsAccountingEntriesTableFilterComposer,
          $$SocietySmsAccountingEntriesTableOrderingComposer,
          $$SocietySmsAccountingEntriesTableAnnotationComposer,
          $$SocietySmsAccountingEntriesTableCreateCompanionBuilder,
          $$SocietySmsAccountingEntriesTableUpdateCompanionBuilder,
          (
            SocietySmsAccountingEntry,
            $$SocietySmsAccountingEntriesTableReferences,
          ),
          SocietySmsAccountingEntry,
          PrefetchHooks Function({
            bool smsMessageId,
            bool financialTransactionId,
          })
        > {
  $$SocietySmsAccountingEntriesTableTableManager(
    _$AppDatabase db,
    $SocietySmsAccountingEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SocietySmsAccountingEntriesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SocietySmsAccountingEntriesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SocietySmsAccountingEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> smsMessageId = const Value.absent(),
                Value<int?> financialTransactionId = const Value.absent(),
                Value<String> entryType = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> transactionDate = const Value.absent(),
                Value<String?> bankName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySmsAccountingEntriesCompanion(
                id: id,
                smsMessageId: smsMessageId,
                financialTransactionId: financialTransactionId,
                entryType: entryType,
                amount: amount,
                transactionDate: transactionDate,
                bankName: bankName,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int smsMessageId,
                Value<int?> financialTransactionId = const Value.absent(),
                required String entryType,
                required double amount,
                required DateTime transactionDate,
                Value<String?> bankName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SocietySmsAccountingEntriesCompanion.insert(
                id: id,
                smsMessageId: smsMessageId,
                financialTransactionId: financialTransactionId,
                entryType: entryType,
                amount: amount,
                transactionDate: transactionDate,
                bankName: bankName,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<
                    $SocietySmsAccountingEntriesTable,
                    SocietySmsAccountingEntry
                  >(table),
                  $$SocietySmsAccountingEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({smsMessageId = false, financialTransactionId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (smsMessageId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.smsMessageId,
                            referencedTable:
                                $$SocietySmsAccountingEntriesTableReferences
                                    ._smsMessageIdTable(db),
                            referencedColumn:
                                $$SocietySmsAccountingEntriesTableReferences
                                    ._smsMessageIdTable(db)
                                    .id,
                          ) as T;
                        }
                        if (financialTransactionId) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.financialTransactionId,
                            referencedTable:
                                $$SocietySmsAccountingEntriesTableReferences
                                    ._financialTransactionIdTable(db),
                            referencedColumn:
                                $$SocietySmsAccountingEntriesTableReferences
                                    ._financialTransactionIdTable(db)
                                    .id,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$SocietySmsAccountingEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SocietySmsAccountingEntriesTable,
      SocietySmsAccountingEntry,
      $$SocietySmsAccountingEntriesTableFilterComposer,
      $$SocietySmsAccountingEntriesTableOrderingComposer,
      $$SocietySmsAccountingEntriesTableAnnotationComposer,
      $$SocietySmsAccountingEntriesTableCreateCompanionBuilder,
      $$SocietySmsAccountingEntriesTableUpdateCompanionBuilder,
      (SocietySmsAccountingEntry, $$SocietySmsAccountingEntriesTableReferences),
      SocietySmsAccountingEntry,
      PrefetchHooks Function({bool smsMessageId, bool financialTransactionId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$BusinessGroupsTableTableManager get businessGroups =>
      $$BusinessGroupsTableTableManager(_db, _db.businessGroups);
  $$BusinessesTableTableManager get businesses =>
      $$BusinessesTableTableManager(_db, _db.businesses);
  $$PartnersTableTableManager get partners =>
      $$PartnersTableTableManager(_db, _db.partners);
  $$BusinessPartnersTableTableManager get businessPartners =>
      $$BusinessPartnersTableTableManager(_db, _db.businessPartners);
  $$FinancialTransactionsTableTableManager get financialTransactions =>
      $$FinancialTransactionsTableTableManager(_db, _db.financialTransactions);
  $$TransactionAuditLogsTableTableManager get transactionAuditLogs =>
      $$TransactionAuditLogsTableTableManager(_db, _db.transactionAuditLogs);
  $$MilkSocietiesTableTableManager get milkSocieties =>
      $$MilkSocietiesTableTableManager(_db, _db.milkSocieties);
  $$SocietySendersTableTableManager get societySenders =>
      $$SocietySendersTableTableManager(_db, _db.societySenders);
  $$MilkProducersTableTableManager get milkProducers =>
      $$MilkProducersTableTableManager(_db, _db.milkProducers);
  $$RegisteredDevicesTableTableManager get registeredDevices =>
      $$RegisteredDevicesTableTableManager(_db, _db.registeredDevices);
  $$SocietySmsMessagesTableTableManager get societySmsMessages =>
      $$SocietySmsMessagesTableTableManager(_db, _db.societySmsMessages);
  $$SocietySmsAccountingEntriesTableTableManager
  get societySmsAccountingEntries =>
      $$SocietySmsAccountingEntriesTableTableManager(
        _db,
        _db.societySmsAccountingEntries,
      );
}
