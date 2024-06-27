import 'package:entrysheet_assistant_app/frontEnd/assist_files/colors.dart';
import 'package:flutter/material.dart';

Widget statusChip(
    {IconData icon = Icons.build,
     String statusName = "None",
     Color bgColor = DEEP_BLUE}){
    return Container(
      padding:const EdgeInsets.symmetric(horizontal:15),
      margin:const EdgeInsets.symmetric(vertical:5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child:Text(
        statusName,
        style:const TextStyle(
          fontWeight: FontWeight.bold,
          color:Colors.white,
          fontSize:15
        ))
    );
}

Widget addButton(
  {Color bgColor = DEEP_BLUE,
  Function() onTap = defaultOnTap}
){
  return GestureDetector(
    onTap:onTap,
    child:Container(
      padding:const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        color:bgColor,
        shape: BoxShape.circle,
      ),
      child:const Icon(Icons.add,color:Colors.white)
    )
  );
}
void defaultOnTap(){}

