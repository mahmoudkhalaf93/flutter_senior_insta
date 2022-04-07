import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/bloc/tasks_cubit.dart';

import '../components.dart';
import '../data.dart';

class BlocActiveScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<TasksCubit, TasksStates>(
     listener: (context, state){},
     builder: (context, state){
       TasksCubit cubit = TasksCubit.get(context);

       return tasksListView(cubit.activeTasks,cubit);
     },
   );

  }


}
