import 'package:flutter/material.dart';
import 'package:todo_list/util/dialog_box.dart';
import 'package:todo_list/util/todo_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo list',
      theme: ThemeData(
      primarySwatch: Colors.brown
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _controller = TextEditingController();
 

  List ToDolist =[
  ["make todo",false],
   ["Do More Exercice",false],
   ["boy stand on  business",false],
   ["Do get you java project done pls ",false],  
   ["home work ",false],
   ["clean your room",false], 

];

void checkboxChange(bool? value ,int index){

  setState(() {
    ToDolist[index][1] =!ToDolist[index][1];
  });

}
//create new task 
void createNewTask(){
  showDialog(
    context: context, 
  builder: (context)
 {
    return dialog_box(
controller: _controller ,

      
    );
  
  },
  );
}


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 60, 60, 60),
      

    appBar: AppBar(
      title: Text('To Do List'),
      backgroundColor: const Color.fromARGB(255, 34, 75, 108),
      
    ),
    floatingActionButton :FloatingActionButton(
      onPressed: createNewTask,
    
    child: Icon(Icons.add),
    backgroundColor: Colors.amber,

    ),

     body: ListView.builder(
      itemCount:ToDolist.length ,
      itemBuilder: (context,index){
      return ToDoTile(
        taskName:ToDolist[index][0],
      taskCompleted:ToDolist[index][1],
       onChanged:(value) => checkboxChange(value,index ),
      );
      },   
     
      
     ),
           
   // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
