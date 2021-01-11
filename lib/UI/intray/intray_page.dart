import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Models/global.dart';
import 'package:todoapp/models/classes/Task.dart';
import 'package:todoapp/models/widgets/intray_todo_widget.dart';

class IntrayPage extends StatefulWidget {
  @override
  _IntrayPageState createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    if(taskList.isEmpty){
      taskList = getList();
    }

    return Container(
      color: darkGreyColor,
      child: _buildList(context),

    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskId),
      title: IntrayTodo(
        title: item.title,
      ),
    );

  }

  Widget _buildList(BuildContext context) {

     return ListView(
       scrollDirection: Axis.vertical,
       padding: EdgeInsets.only(top: 300.0),

       children: taskList.map((Task item) => _buildListTile(context, item)).toList()
     );

  }

  List<Task> getList() {
    for (int i = 0; i < 10; i++) {
      taskList
          .add(new Task("My fist todo" + i.toString(), false, i.toString()));
    }
    return taskList;
  }
}
