import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:testapp/modules/archive/archive.dart';
import 'package:testapp/modules/doneTasks/donetasks.dart';
import 'package:testapp/modules/newTasks/tasks.dart';
import 'package:testapp/shared/BlocHome/HomeState.dart';

class CubitHome extends Cubit<HomeState> {
  CubitHome() : super(AppInitialState());
  static CubitHome get(context) => BlocProvider.of(context);
  int currentindex = 0;
  bool isbottomsheet = false;
  IconData icon = Icons.edit;
  Database database;
  List<Map> newtasks = [];
  List<Map> donetasks = [];
  List<Map> archivetasks = [];
  List<Map> tasks = [];

  List modules = [
    NewTasks(),
    DoneTasks(),
    ArchiveTasks(),
  ];
  List<String> menu = [
    'NewTasks',
    'DoneTasks',
    ' ArchiveTasks',
  ];

  void ChangeIndex(int index) {
    currentindex = index;
    emit(ChangeBottomNavState(index: currentindex));
  }

  void changeBottomSheet(bool sheet, IconData fab) {
    isbottomsheet = sheet;
    icon = fab;
    emit(ChangeBottomSheetState());
  }

  void createdatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) {
      database
          .execute(
              'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status TEXT)')
          .then((value) => print('table is created'))
          .catchError((onError) {
        print('error is:${onError.toString()}');
      });
    }, onOpen: (database) {
      getTasks(database);
    }).then((value) {
      database = value;
      emit(CreateDataBaseState());
    });
  } // create and open databse//

  insertToDatabase({
    @required String title,
    @required String time,
    @required String date,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(InsertDataBaseState());

        getTasks(database);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });

      return null;
    });
  }

  void updateDb({@required String status, @required int id}) {
    database.rawUpdate('UPDATE tasks SET  status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getTasks(database);
      emit(UpdateDataBaseState());

    });
  }

  void getTasks(database) {
    newtasks=[];
    donetasks=[];
    archivetasks=[];
    emit(LoadingDataBaseState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      tasks = value;
    tasks.forEach((element) {
      if(element['status']=='new')
        newtasks.add(element);
      else  if(element['status']=='done')
        donetasks.add(element);
      else archivetasks.add(element);
    });
      emit(GetDataBaseState());

    });

  }
  void delete({@ required int id})
  {
    database
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getTasks(database);
      emit(DeleteDataBaseState());

    });
  }

}
