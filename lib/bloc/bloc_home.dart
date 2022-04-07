import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_senior/basics/archive_tasks_screen.dart';
import 'package:flutter_senior/basics/done_tasks_screen.dart';
import 'package:flutter_senior/bloc/bloc_active_tasks_screen.dart';
import 'package:flutter_senior/bloc/tasks_cubit.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../data.dart';




class BlocHomeScreen extends StatelessWidget {

  var Scaffoldkey= GlobalKey<ScaffoldState>();
  var formkey= GlobalKey<FormState>();
  late BuildContext context;
  late TasksCubit cubit;



  //_HomeScreenState(){
   // print('Constructor run');
 // }

  //@override
  //void initState() {
    // TODO: implement initState
    //super.initState();
    //print('initState run');
   // MyOpenDatabase();

  //}

  @override
  Widget build(BuildContext context) {
    this.context=context;

    return BlocProvider(create: (context) => TasksCubit(InitTasksState())..MyOpenDatabase(),
      child: BlocConsumer<TasksCubit, TasksStates>(
        listener: (context, state) {
          print(state);

          print(state is BottomSheetChangeState);

          if (state is BottomSheetChangeState){

          }
          else if(state is InitTasksState)
          {

          }
          else if(state is DeleteTasksState)
          {
            snackBar();
            }

        } ,
        builder: (context, state) {
           cubit = TasksCubit.get(context);
          return Scaffold(
            key: Scaffoldkey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.bottomNavigationIndex]),),

            floatingActionButton: Visibility(
              visible: (cubit.bottomNavigationIndex == 0),
              child: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheetExpanded) {
                    if (formkey.currentState!.validate()) {
                      String title = titleController.text;
                      String date = dateController.text;
                      String time = timeController.text;
                      cubit.insertTasks(title: title, date: date, time: time,);
                      Navigator.of(context).pop();
                      cubit.isBottomSheetExpanded = false;
                    }
                  }
                  else {
                    Scaffoldkey.currentState!.showBottomSheet((context) =>
                        buildBottomitemSheet())
                        .closed.
                    then((value) {

                      timeController.text = "";
                      titleController.text = "";
                      dateController.text = "";
                      cubit.changeBottomSheetState(false);
                      //setState(() {});
                    });

                    cubit.changeBottomSheetState(true);
                    //setState(() {

                    //});
                  }
                },
                child: cubit.isBottomSheetExpanded ? Icon(Icons.add,) : Icon(Icons.edit,),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                print(value);
                cubit.bottomNavigationIndex = value;
                cubit.changeBottomNavigationState(value);
                //setState(() {});
              },
              type: BottomNavigationBarType.shifting,
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.bottomNavigationIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard,), label: 'Active'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.done_all,), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive,), label: 'Archive'),
              ],
            ),

            body: cubit.screens[cubit.bottomNavigationIndex],


          );
        },
      ),
    );
  }
  snackBar(){
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Text('Task deleted'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
          cubit.undoDeletedTask();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

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
        lastDate: DateTime(2024)) //what will be the up to supported date in picker
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






}


