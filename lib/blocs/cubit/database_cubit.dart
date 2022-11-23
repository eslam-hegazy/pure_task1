import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'database_state.dart';

class DatabaseCubit extends Cubit<DatabaseState> {
  DatabaseCubit() : super(DatabaseInitial());
  static DatabaseCubit get(context) => BlocProvider.of(context);
  var database;
  List<Map> data = [];
  ///////////////////////create database
  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('database created');
        database
            .execute(
                'CREATE TABLE product(id INTEGER PRIMARY KEY, title TEXT, des TEXT, pic TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('Error When Creating Table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase().then((value) {
          emit(GetDataBaseState());
        }).catchError((error) {
          print(error);
        });
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(CreateDataBaseState());
    });
  }

  //////////////////////Insert DataBase
  insertToDatabase({
    required String title,
    required String des,
    required String image,
  }) async {
    await database.transaction((txn) async {
      data = [];
      await txn
          .rawInsert(
        'INSERT INTO product(title, des, pic) VALUES("$title", "$des", "$image")',
      )
          .then((value) {
        print("$value Insert Successfully");
        getDataFromDatabase();
        emit(InsertDataBaseState());
      }).catchError((error) {
        print(error.toString());
      });
    });
  }

  ////////////////////get data

  Future getDataFromDatabase() async {
    data = [];
    emit(GetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM product').then((value) {
      value.forEach((element) {
        data.add(element);
      });
      print(data);
      emit(GetDataBaseState());
    });
  }

  /////////////////////////Delete data
  void deleteData({
    required int id,
  }) async {
    await database
        .rawDelete('DELETE FROM product WHERE id = ?', [id]).then((value) {
      emit(DeleteDataBaseState());
      getDataFromDatabase().then((value) {
        emit(GetDataBaseState());
      }).catchError((error) {
        print(error);
      });
    });
  }

  void updateData({
    required int id,
    required String title,
    required String des,
    required String image,
  }) async {
    await database.rawUpdate(
      'UPDATE product SET title = ?,des= ?,pic= ? WHERE id = ?',
      ['$title', '$des', '$image', id],
    ).then((value) {
      print("update");
      getDataFromDatabase();
      emit(UpdateDataBaseState());
    }).cachError((error) {
      print(error.toString());
    });
  }
}
