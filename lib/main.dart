import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List App',
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  // List<String>
  List tasks = [];
  String singlevalue = "";

  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  Addlist() {
    setState(() {
      tasks.add({"value": singlevalue});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 205, 233),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 109, 100, 133),
        title: Text('To-Do List', style: TextStyle(
          fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 75,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text(tasks[index]),
                  title: Text(tasks[index]['value'].toString(), style: TextStyle(
                    color: Color.fromARGB(255, 109, 100, 133)),),
                  trailing: IconButton(
                    icon: Icon(Icons.delete,color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              // onSubmitted: (value) {
              //   setState(() {
              //     tasks.add(value);
              //   });
              // },
              onChanged: (content) {
                addString(content);
              },
              decoration: InputDecoration(
                hintText: 'Add a task',hintStyle: TextStyle(color:  Color.fromARGB(255, 109, 100, 133)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                   
                    Addlist();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
