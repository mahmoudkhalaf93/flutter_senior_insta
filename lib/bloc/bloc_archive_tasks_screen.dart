import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_senior/bloc/tasks_cubit.dart';
import 'package:flutter_senior/data.dart';

import '../components.dart';

class BlocArchiveScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<TasksCubit, TasksStates>(
     listener: (context, state){},
     builder: (context, state){
       TasksCubit cubit = TasksCubit.get(context);

       return tasksListView(cubit.archiveTasks, cubit);
     },
   );

  }


}
