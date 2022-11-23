part of 'database_cubit.dart';

@immutable
abstract class DatabaseState {}

class DatabaseInitial extends DatabaseState {}

class CreateDataBaseState extends DatabaseState {}

class InsertDataBaseState extends DatabaseState {}

class InsertPictureState extends DatabaseState {}

class GetDataBaseState extends DatabaseState {}

class GetDatabaseLoadingState extends DatabaseState {}

class DeleteDataBaseState extends DatabaseState {}

class UpdateDataBaseState extends DatabaseState {}
