import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


 class ToDoTile extends StatelessWidget{
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged; 


   ToDoTile({super.key, 
   required this.taskName, 
   required this.taskCompleted,
   required this.onChanged,
 });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.only(left: 24,top: 24,right: 24),
         child: Row(

          
           children: [

            Checkbox(value: taskCompleted,
             onChanged: onChanged,
             activeColor:Colors.black,
             ),
             Text(taskName,
            style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough:TextDecoration.none,color: Colors.amberAccent),
            
            
             )
           ],
         ),
       decoration: BoxDecoration(
       color: Color.fromARGB(31, 110, 109, 109),
       borderRadius :BorderRadius.circular(12),
       )
      ),
    );

  }
  
}