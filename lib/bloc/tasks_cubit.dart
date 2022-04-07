
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/basics/archive_tasks_screen.dart';
import 'package:flutter_senior/basics/done_tasks_screen.dart';
import 'package:flutter_senior/bloc/bloc_active_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';

import '../data.dart';
import 'bloc_archive_tasks_screen.dart';
import 'bloc_done_tasks_screen.dart';

class TasksStates {}

class InitTasksState extends TasksStates{}

class BottomNavigationChangeState extends TasksStates{}

class BottomSheetChangeState extends TasksStates {}

class InsertTasksState extends TasksStates{}

class DeleteTasksState extends TasksStates{}

class GetTasksState extends TasksStates{}

class TasksCubit extends Cubit<TasksStates> {


  TasksCubit(TasksStates initialState) : super(initialState);

  static TasksCubit get(context) => BlocProvider.of(context);

  static String getName() => "Amir";

  int bottomNavigationIndex=0;
  List<String> titles=['Active','Done','Archive'];
  List<Widget> screens=[BlocActiveScreen(),BlocDoneScreen(),BlocArchiveScreen(),];

  bool isBottomSheetExpanded = false ;

  void changeBottomNavigationState(int value) {
    bottomNavigationIndex = value;
    emit(BottomNavigationChangeState());
  }

  void changeBottomSheetState(bool value) {
    isBottomSheetExpanded = value;
    emit(BottomSheetChangeState());
  }
  late Database database;
  //open database
  void MyOpenDatabase() async {
    database= await openDatabase(
      //name of database
      "TasksDatabase",
      //version
      version:2,
      //create database
      onCreate:(db, version) async{
        print('create');
        await db.execute("CREATE TABLE Tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)");},
      onOpen: (db){
        print('open');
        database=db;
        getTasks();
      },
    );
    // )
    // open the database

  }
  //insert records
  void insertTasks({required String title, required String date, required String time, String status = "active"}) async{
    await database.transaction((txn) async {
      int id = await txn.rawInsert('INSERT INTO Tasks(title,date,time,status) VALUES("$title", "$date", "$time","$status")');
      print('Raw Insert ID => $id');
      getTasks();
    });
  }
  //get records

  List<Map> activeTasks= [];
  List<Map> doneTasks= [];
  List<Map> archiveTasks= [];

  void getTasks() async{
    activeTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="active"');
    doneTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="done"');
    archiveTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="archive"');
    
    emit(GetTasksState());

  }
  //update records
  void updateTasks({required String status,required int taskid}) async{
    await database.rawUpdate('UPDATE Tasks SET status = ? WHERE id = ?', ['$status',taskid]);
    getTasks();

  }
  //delete records

  late Map<dynamic, dynamic> _deletedTask;

  void deleteTasks({required Map<dynamic, dynamic> task}) async{
    _deletedTask = task;

    await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [task['id']]);
    emit(DeleteTasksState());
    getTasks();
  }

  //undo

  void undoDeletedTask() {
    insertTasks(
      title: _deletedTask['title'],
      date: _deletedTask['date'],
      time: _deletedTask['time'],
      status: _deletedTask['status'],
    );
  }

}