import 'package:flutter/material.dart';
import 'package:flutter_senior/basics/active_tasks_screen.dart';
import 'package:flutter_senior/basics/archive_tasks_screen.dart';
import 'package:flutter_senior/basics/done_tasks_screen.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../data.dart';




class HomeScreen extends StatefulWidget {



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var Scaffoldkey= GlobalKey<ScaffoldState>();
  var formkey= GlobalKey<FormState>();
  int bottomNavigationIndex=0;
  List<String> titles=['Active','Done','Archive'];
  List<Widget> screens=[ActiveScreen(),DoneScreen(),ArchiveScreen(),];

  bool isBottomSheetExpanded = false ;

  _HomeScreenState(){
    print('Constructor run');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState run');
    MyOpenDatabase();

  }

  @override
  Widget build(BuildContext context) {

    print('Build run');

    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(title: Text(titles[bottomNavigationIndex]),),

  floatingActionButton: Visibility(
    visible: (bottomNavigationIndex==0),
    child: FloatingActionButton(
      onPressed: (){
        if(isBottomSheetExpanded){
           if (formkey.currentState!.validate()){
             String title= titleController.text;
             String date=dateController.text;
             String time=timeController.text;
             insertTasks(title: title, date: date, time: time,);
             Navigator.of(context).pop();
             isBottomSheetExpanded = false ;
           }

        }
        else{
          Scaffoldkey.currentState!.showBottomSheet((context) =>  buildBottomitemSheet())
          .closed.
          then((value) {
            isBottomSheetExpanded = false;
            timeController.text="";
            titleController.text="";
            dateController.text="";

            setState(() {

            });
          });

          isBottomSheetExpanded = true ;
          setState(() {});
        }


      },
      child:  isBottomSheetExpanded ? Icon(Icons.add,) :  Icon(Icons.edit,),
    ),
  ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
      print(value);
      bottomNavigationIndex=value;
      setState(() {

      });
        },
        type:BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: bottomNavigationIndex,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.dashboard,),label: 'Active'),
          BottomNavigationBarItem(icon:Icon(Icons.done_all,),label: 'Done'),
          BottomNavigationBarItem(icon:Icon(Icons.archive,),label: 'Archive'),
        ],
      ),

      body: screens[bottomNavigationIndex],




    );
  }
  var titleController=TextEditingController();
  var dateController=TextEditingController();
  var timeController=TextEditingController();

  buildBottomitemSheet() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Form(
        key:formkey ,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          TextFormField(
            validator: (value)=> validator(value!),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'title',
              prefixIcon: Icon(Icons.title,),
            ),
            controller: titleController,

          ),
          SizedBox(height: 10.0,),
          TextFormField(
            validator: (value)=>validator(value!),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'date',
              prefixIcon: Icon(Icons.date_range,),
            ),
            controller: dateController,
            keyboardType: TextInputType.none,
            onTap: (){
              print('Date Tapped');
              _pickDateDialog();
            },
          ),
          SizedBox(height: 10.0,),
          TextFormField(
            validator: (value)=>validator(value!),

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'time',
              prefixIcon: Icon(Icons.timer_outlined,),
            ),
            controller: timeController,
            keyboardType: TextInputType.none,
            onTap: (){
              print('time Tapped');
              _picktimeDialog();
              },
          ),
        ],),
      ),
    );
  }
  String? validator(String value){
    if(value.isEmpty){
      return "Required";
    }
    return null;
  }

  void _pickDateDialog() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        //which date will display when user open the picker
        firstDate: DateTime(1950),
        //what will be the previous supported year in picker
        lastDate: DateTime(2022)) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      print('Date picker dialog');
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      print(pickedDate.toString().split(" ")[0]);
      dateController.text= pickedDate.toString().split(" ")[0];

    });
  }
  void _picktiDialog(){
    Future<TimeOfDay?> selectedTimeRTL = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
  void _picktimeDialog() async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    print('time picker');
    String realhour= (pickedTime!.hour >12)? "${pickedTime.hour -12}:${pickedTime.minute} PM"
        :"${pickedTime.hour }:${pickedTime.minute} AM";

    String time="${realhour}";
    timeController.text=time;

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
void insertTasks({required String title, required String date, required String time}) async{
  await database.transaction((txn) async {
    int id = await txn.rawInsert('INSERT INTO Tasks(title,date,time,status) VALUES("$title", "$date", "$time","active")');
    print('Raw Insert ID => $id');
    getTasks();
    });
}
  //get records
void getTasks() async{
  activeTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="active"');
  doneTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="done"');
  archiveTasks = await database.rawQuery('SELECT * FROM Tasks WHERE status="archive"');

  }
  //update records
void updateTasks({required String status,required int taskid}) async{
 await database.rawUpdate('UPDATE Tasks SET status = ?, WHERE id = ?', ['$status',taskid]);


}
  //delete records
void deleteTasks({required int tasksid}) async{
  await database.rawDelete('DELETE FROM Tasks WHERE id = ?', [tasksid]);
}


}
