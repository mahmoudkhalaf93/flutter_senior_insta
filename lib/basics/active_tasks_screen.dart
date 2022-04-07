import 'package:flutter/material.dart';
import 'package:flutter_senior/data.dart';

import '../components.dart';

class ActiveScreen extends StatefulWidget {

  @override
  _ActiveScreenState createState() => _ActiveScreenState();
}

class _ActiveScreenState extends State<ActiveScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView(activeTasks, null);

  }


}
