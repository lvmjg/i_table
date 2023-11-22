import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/util/globals.dart';
import '../../home/presentation/widget/home_page/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(primary: Colors.grey),
          scaffoldBackgroundColor: Colors.white,
          textTheme:
              GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme)
                  .apply(),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(padding),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
            ),
          ),
        ),
        child: SafeArea(
          child: SignInScreen(
            headerBuilder: (context, contraints, test) {
              return Container(
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(padding),
                        bottomRight: Radius.circular(padding))),
                height: 100,
                child: Center(
                  child: Text(
                    appName,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              );
            },
            actions: [
              AuthStateChangeAction((context, state) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              })
            ],
            providers: [EmailAuthProvider(), UniversalEmailSignInProvider()],
          ),
        ),
      ),
    );
  }
}
