import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_table/features/authentication/login_page.dart';
import 'package:i_table/features/search/presentation/bloc/search_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'features/restaurant_details/presentation/bloc/restaurant_details_bloc.dart';
import 'features/restaurant_plan/presentation/bloc/restaurant_plan_bloc.dart';
import 'features/search/presentation/search_page.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //emu "10.0.2.2" 8080
  //pd
  FirebaseFirestore ff = FirebaseFirestore.instance;
  ff.useFirestoreEmulator('127.0.0.1', 8080);

  FirebaseAuth fa = FirebaseAuth.instance;
  fa.useAuthEmulator('127.0.0.1', 8080);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
        BlocProvider(
          create: (context) => RestaurantDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => RestaurantPlanBloc(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        //default blue app bar and white background
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color(primary),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Color(primary)),
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:  Color(primary),
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: Color(primary),
              systemNavigationBarIconBrightness: Brightness.light,
            ),
          ),
          textTheme:
              GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme),
        ),
        home: SearchPage(),
      ),
    );
  }
}
