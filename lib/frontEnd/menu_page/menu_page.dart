import 'package:entrysheet_assistant_app/backEnd/handlers/companyinfo_db_handler.dart';
import 'package:entrysheet_assistant_app/constant.dart';
import 'package:entrysheet_assistant_app/frontEnd/assist_files/colors.dart';
import 'package:entrysheet_assistant_app/frontEnd/assist_files/dialogs.dart';
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
        return Column(children:[
          companyList(snapshot.data!,0),
          companyList(snapshot.data!,1),
          companyList(snapshot.data!,2),
          companyList(snapshot.data!,3),
          companyList(snapshot.data!,4),
          companyList(snapshot.data!,5),
          companyList(snapshot.data!,6),
        ]);
      } else if (snapshot.hasError) {
        return const Text("エラー！！！");
      } else {
        return const Text("No data");
      }
    },
  );
}

  Widget companyList (List<Map<String,dynamic>> data,int index){
    String stateID = CompanyStateID().indexToCompanyStateID(index);
    String stateName = CompanyStateID().indexToCompanyStateName(index);
    Color statusChipColor = Colors.grey;
    List<Map> targetList = [];
    for(int i = 0; i < data.length; i++){
      if(data.elementAt(i)["state"] == stateID){
        targetList.add(data.elementAt(index));
      }
    }
    switch (index){
      case 0: statusChipColor = Colors.green;
      case 1: statusChipColor = DEEP_BLUE;
      case 2: statusChipColor = DEEP_BLUE;
      case 3: statusChipColor = Colors.redAccent;
      case 4: statusChipColor = Colors.redAccent;
    }
    Widget statusIndex = const SizedBox();
    if(targetList.isNotEmpty){
      statusIndex = statusChip(statusName:stateName,bgColor: statusChipColor);
    }
    return Column(children:[
      Row(children:[
        statusIndex,
        const Spacer()
      ]),
      ListView.builder(itemBuilder: (context,index){
        if(data.elementAt(index)["state"] == stateID){
          return companyObject(data.elementAt(index));
        }else{
          return Container();
        }
      },
      shrinkWrap: true,
      physics:const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      )
    ]);
   }
  
  Widget companyObject(Map<String,dynamic> data){
    return GestureDetector(
      onTap:(){},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical:5,horizontal:0),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: SILVER,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            // BoxShadow(
            //   color: Colors.black.withOpacity(0.2), // 影の色
            //   spreadRadius: 1, // 影の広がりの範囲
            //   blurRadius: 1, // ぼかしの範囲
            //   offset:const Offset(0, 1), // 影の位置（水平, 垂直）
            // ),
          ],
        ),
        child: Row(
         children:[
           Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child:const Icon(Icons.work,size:25,color: Colors.white,)
          ), 
          const SizedBox(width:10),
          Expanded(child:
            Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:[
              Text(data["companyName"],
                style:const TextStyle(
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.clip,
                fontSize:15)),
              Row(children:[
                GestureDetector(
                  onTap:()async{
                    await showDeleteConfirmationDialog(context,
                      ()async {
                        await CompanyInfoDBHandler().deleteData(data["id"]);
                      },setState);
                      setState((){});
                  },
                  child:const Icon(Icons.delete,color:Colors.grey),),
                const SizedBox(width:5),
                GestureDetector(
                  onTap: () async{
                    await showAddCompanyDialog(
                      context,setState,isEdit:true,data:data);
                  },
                  child:const Icon(Icons.edit,color:Colors.grey),),
              ])
            ])
          )
        ]),
      ),
    );
  }
}