import 'package:flutter/material.dart';
import 'package:flutter_senior/data.dart';

import '../components.dart';

class DoneScreen extends StatefulWidget {

  @override
  _DoneScreenState createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView(doneTasks,null);
  }
}
