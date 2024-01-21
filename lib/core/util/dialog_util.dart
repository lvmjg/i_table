import 'package:flutter/material.dart';
import 'package:i_table/core/util/globals.dart';

class DialogUtil{

  static Future<bool> showConfirmationDialog(BuildContext context, String title, String content, String cancel, String ok) async {
    bool? confirmed = await showDialog<bool>(context: context, builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(ok),
        ),
      ],
    ));

    return confirmed ?? false;
  }
}