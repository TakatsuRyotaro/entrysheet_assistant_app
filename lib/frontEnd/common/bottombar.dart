
import 'package:entrysheet_assistant_app/frontEnd/assist_files/colors.dart';
import 'package:flutter/material.dart';

Widget bottomBar(Function(int) onItemTapped, int selectedIndex){
  return 
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    const Divider(height:0.5,thickness:0.5,color:Colors.grey),
    BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'メニュー',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '企業サイト',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          label: 'メール管理',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: DEEP_BLUE,
      onTap: onItemTapped,
    )]);
  
}