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
      padding:const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: linarGradientDecotation(bgColor,0.5),
        shape: BoxShape.circle,
      ),
      child:const Icon(
        Icons.add_rounded,
        color:Colors.white,
        size: 25,
    ))
  );
}
void defaultOnTap(){}

Gradient linarGradientDecotation(Color target,double amount){
  return  LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      lightenColor(target,amount),
      target,
      target,
    ],
  );
}