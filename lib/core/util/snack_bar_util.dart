import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class SnackBarUtil {
  static void showSnackBar(BuildContext context, String content) {
    if (content.isEmpty) return;

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(
          content: Text(content),

        action: SnackBarAction(
          textColor: Color(primary),
          label: ok, onPressed: () {},
        ),
      ));
    });
  }
}
