import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/user_profile/presentation/user_profile_page.dart';

import '../../../../../user_actions/presentation/user_actions_page.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  late int currentIndex = 0;

  HomeBottomNavigationBar({super.key}) {
    currentIndex = 1;
  }

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}



class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        elevation: 25,
        onTap: (value) async {
          if (value == widget.currentIndex) {
            return;
          }

          setState(() {
            widget.currentIndex = value;
          });

          if (value == 2) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UserProfilePage()));
          }

          if (value == 0) {
            FirebaseFunctions functions = FirebaseFunctions.instance;
            functions.useFunctionsEmulator('127.0.0.1', 5001);
            HttpsCallableResult<dynamic> resut =
                await functions.httpsCallable('helloWorld').call<dynamic>();
            dynamic result = resut.data;
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserActionsPage()));
          }
        },
        selectedIconTheme: IconThemeData(color: Colors.white),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded), label: homeResOrd),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: homeSearch),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded), label: homeProfile),
        ]);
  }
}
