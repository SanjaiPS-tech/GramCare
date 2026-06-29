// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_dao.dart';

// ignore_for_file: type=lint
mixin _$MedicineDaoMixin on DatabaseAccessor<AppDatabase> {
  $UsersTable get users => attachedDatabase.users;
  $MedicinesTable get medicines => attachedDatabase.medicines;
  $MedicineLogsTable get medicineLogs => attachedDatabase.medicineLogs;
  MedicineDaoManager get managers => MedicineDaoManager(this);
}

class MedicineDaoManager {
  final _$MedicineDaoMixin _db;
  MedicineDaoManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db.attachedDatabase, _db.users);
  $$MedicinesTableTableManager get medicines =>
      $$MedicinesTableTableManager(_db.attachedDatabase, _db.medicines);
  $$MedicineLogsTableTableManager get medicineLogs =>
      $$MedicineLogsTableTableManager(_db.attachedDatabase, _db.medicineLogs);
}
