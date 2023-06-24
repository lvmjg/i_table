import 'package:flutter/material.dart';

import '../../util/globals.dart';

class Failure extends StatelessWidget {
  final String errorMessage;
  final Function() onPressed;

  const Failure({Key? key, required this.errorMessage, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: padding,
          ),
          ElevatedButton(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Text(tryAgain),
              ),
              style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 0, color: Colors.white),
                  backgroundColor: Color(primary),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(200)))),
              onPressed: onPressed)
        ],
      ),
    );
  }
}
