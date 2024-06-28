import 'package:flutter/cupertino.dart';

Future<void> showDeleteConfirmationDialog(
  BuildContext context,
  Function() onDelete,
  StateSetter setState)async{
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("削除確認"),
          content:const Text("本当にこの企業を削除しますか？\nこの企業に関連するデータも削除されます。"),
          actions: [
            CupertinoDialogAction(
              child: const Text("キャンセル"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              isDefaultAction: true,
              child: const Text("削除"),
              onPressed: () async{
                Navigator.of(context).pop();
                await onDelete();
                setState((){});
              },
            ),
          ],
        );
      },
    );
  }