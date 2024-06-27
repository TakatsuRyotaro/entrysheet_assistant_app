
import 'package:entrysheet_assistant_app/backEnd/handlers/companyinfo_db_handler.dart';
import 'package:entrysheet_assistant_app/backEnd/models/companyinfo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showAddCompanyDialog(
  BuildContext context,
  StateSetter setosute,
  {int selectedIndex = 0,
   String companyName = "",
   bool isEdit = false,
   }) async{
  TextEditingController companyNameController = TextEditingController(text:companyName);
  String dialogTitle = "会社情報を追加";
  if(isEdit){dialogTitle = "会社情報を編集";}


  List<String> items = [
    '検討中',
    'インターン選考中',
    'インターン参加',
    '本選考中',
    '内定',
    '落選',
    'その他',
  ];

  String companyStateID = "other";
  void returnCompanyStateID(){
    switch (selectedIndex){
      case 0: companyStateID = "watching";
      case 1: companyStateID = "inturn_selection";
      case 2: companyStateID = "inturn_join";
      case 3: companyStateID = "main_selection";
      case 4: companyStateID = "got_job";
      case 5: companyStateID = "prayed";
      default: companyStateID = "other";
    }
  }


    Widget companyStateList = CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (int index) {
        selectedIndex = index;
      },
      children: List<Widget>.generate(items.length, (int index) {
        return Center(
          child: Text(items[index]),
        );
      }),
    );

  await showDialog(
    context: context,
    builder:(context){
      return CupertinoAlertDialog(
        title: Text(dialogTitle),
        content: Column(children:[
          CupertinoTextField(
            controller: companyNameController,
            placeholder: "会社名",
          ),
          const SizedBox(height:5),
          const Text("会社の選考状態"),
          const SizedBox(height:3),
          companyStateList
        ]),
        actions: [
          TextButton(
            onPressed:(){Navigator.pop(context);},
            child:const Text("キャンセル",
              style:TextStyle(color:Colors.red)),
          ),
          TextButton(
            onPressed:()async{
              returnCompanyStateID();
              if(!isEdit){
                await CompanyInfoDBHandler().addData(
                  CompanyInfo(
                    id: 0,
                    companyName: companyNameController.text,
                    state: companyStateID)
                );
                setosute((){});
              }else{

              }
              print(companyNameController.text);
              print(companyStateID);
              Navigator.pop(context);},
            child:const Text("登録"),
          ),
        ],
      );
    });
             
}