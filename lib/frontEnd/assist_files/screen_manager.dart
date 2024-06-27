import 'package:entrysheet_assistant_app/frontEnd/common/appbar.dart';
import 'package:entrysheet_assistant_app/frontEnd/common/bottombar.dart';
import 'package:entrysheet_assistant_app/frontEnd/menu_page/menu_page.dart';
import 'package:flutter/material.dart';

class ScreenManager extends StatefulWidget{
  @override
  _ScreenManagerState createState()=> _ScreenManagerState();
} 

class _ScreenManagerState extends State<ScreenManager>{
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }
  
  void onItemTapped(int value){
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbAar(),
      body: pageList()[selectedIndex],
      bottomNavigationBar: bottomBar(onItemTapped, selectedIndex),
    );
  }

  List<Widget> pageList(){
    return [
      MenuPage(),
      MenuPage(),
      MenuPage(),
    ];
  }
  



}