import 'package:entrysheet_assistant_app/backEnd/handlers/companyinfo_db_handler.dart';
import 'package:entrysheet_assistant_app/frontEnd/assist_files/colors.dart';
import 'package:entrysheet_assistant_app/frontEnd/assist_files/ui_components.dart';
import 'package:entrysheet_assistant_app/frontEnd/menu_page/add_company_dialog.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget{
  @override
  _MenuPageState createState()=> _MenuPageState();
} 

class _MenuPageState extends State<MenuPage>{
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    TextStyle titleStyle =const TextStyle(
      fontWeight:FontWeight.bold,
      fontSize:30
    );
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child:ListView(children:[
        Row(children:[
          Text("会社一覧",style:titleStyle),
          const Spacer(),
          addButton(
           onTap: () async{
            await showAddCompanyDialog(context,setState);
           })
        ]),
        companyLists(),
        Row(children:[
          statusChip(statusName:"検討中",bgColor: Colors.green),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"インターン選考中",bgColor: DEEP_BLUE),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"インターン参加",bgColor: DEEP_BLUE),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"本選考中",bgColor: Colors.redAccent),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"🎉内定",bgColor: Colors.redAccent),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"🙏落選",bgColor: Colors.grey),
          const Spacer()
        ]),
        Row(children:[
          statusChip(statusName:"その他",bgColor: Colors.grey),
          const Spacer()
        ]),
      ])
    );
  }

Widget companyLists() {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: CompanyInfoDBHandler().getData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator(color: Colors.blue));
      } else if (snapshot.hasData) {
        return watchingList(snapshot.data!);
      } else if (snapshot.hasError) {
        return const Text("エラー！！！");
      } else {
        return const Text("No data");
      }
    },
  );
}

  Widget watchingList (List<Map<String,dynamic>> data){
    return ListView.builder(itemBuilder: (context,index){
      return Text(data.elementAt(index).toString());
    },
    shrinkWrap: true,
    physics:const NeverScrollableScrollPhysics(),
    itemCount: data.length,
    );
  }


}