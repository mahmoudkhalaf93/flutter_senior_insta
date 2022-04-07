import 'package:flutter/material.dart';
import 'package:flutter_senior/data.dart';

import '../components.dart';

class ArchiveScreen extends StatefulWidget {

  @override
  _ArchiveScreenState createState() => _ArchiveScreenState();
}

class _ArchiveScreenState extends State<ArchiveScreen> {
  @override
  Widget build(BuildContext context) {
    return tasksListView(archiveTasks,null);
  }
}
