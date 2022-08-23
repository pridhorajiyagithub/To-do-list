import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myApp(),
    ),
  );
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  State<myApp> createState() => _myAppState();
}

int v = 9;
String? toDo;
String t = 'AM';
var change;

class _myAppState extends State<myApp> {
  Map map = {
    '$v:00\n$t': toDo,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: () {
                if (change == 0) {}
              },
              child: const Icon(Icons.apps),
            ),
          ),
        ],
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: map.entries.map((e) {
            return Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.black45,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${e.key}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: TextField(
                      onChanged: (text) {
                        toDo = text;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter Your To-Do Here",
                      ),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (v < 13) {
              map['${v++}:00\n$t'] = toDo;
            } else {
              v = 1;
              t = 'PM';
              map['${v++}:00\n$t'] = toDo;
            }
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
/*
  void time1() {
    if (v < 11) {
      map['${v++}:00'] = toDo;
      t = 'AM';
    } else {
      map['${v++}:00'] = toDo;
      v = 1;

      t = 'PM';
    }
  }*/
}
