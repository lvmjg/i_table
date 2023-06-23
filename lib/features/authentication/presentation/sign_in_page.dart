import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/util/globals.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: Theme.of(context).appBarTheme.systemOverlayStyle!,
      child: Container(
      //  color: Color(primary),
        child: Theme(
          data: ThemeData(
              colorScheme: ColorScheme.light(primary: Colors.white60, secondary: Colors.white),
              scaffoldBackgroundColor: Color(primary),
            textTheme: GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme).apply(displayColor: Colors.white, bodyColor: Colors.white),

            inputDecorationTheme: InputDecorationTheme(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              suffixStyle:TextStyle(color: Colors.black) ,
              helperStyle: TextStyle(color: Colors.black),
              prefixStyle: TextStyle(color: Colors.black),
              hintStyle:TextStyle(color: Colors.black) ,
              labelStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(200),
                borderSide: BorderSide.none
              ),

            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.all(padding),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Color(primary)),
              ),
            ),
          ),
          child: SafeArea(

            child: SignInScreen(
              headerBuilder: (context, contraints, test){
                return Container(
                  decoration: BoxDecoration(color: Colors.white,

                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(padding), bottomRight: Radius.circular(padding))
                  ),

                  height: 100,
                  child: Center(
                    child:Text(
                      appName,
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(primary),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              },


             // styles: FirebaseUIStyle.ofType(),
              //  styles: ,

              providers: [EmailAuthProvider(), UniversalEmailSignInProvider()],

            ),
          ),
        ),
      ),
    );
  }
}
