
import 'package:flutter/material.dart';
import 'package:todo_list/util/my_button.dart';

class dialog_box extends StatefulWidget {
  final controller; 
 VoidCallback onSave;
 VoidCallback oncancel;
   
    dialog_box({super.key,required 
    this.controller,
   required this.onSave,
   required this.oncancel, 
   });
  @override
  State<dialog_box> createState() => _dialog_boxState();
}

class _dialog_boxState extends State<dialog_box>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

@override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
//main
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    backgroundColor: Colors.purple,
      content: Container( 
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        
        //get user input
        TextField(
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: "Add a new task ",

          )
        ),


        // buttons -> save + cancel
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
          //save button
  
         Mybutton(text: "save", onPressed: onSave),

         const SizedBox(width: 8),
        //cancel button 
           Mybutton(text: "cancel",onPressed: oncancel),
          ],
          )

      ]),
      ),
       
    );
  }
}