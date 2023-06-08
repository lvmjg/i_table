import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_table/features/search/presentation/bloc/search_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'features/restaurant_details/presentation/bloc/restaurant_details_bloc.dart';
import 'firebase_options.dart';
import 'features/home/presentation/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore ff = FirebaseFirestore.instance;
  ff.useFirestoreEmulator("10.0.2.2", 8080);

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
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          primaryColor: Color(primary),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Color(primary)),
          appBarTheme: AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.white),
          ),
          textTheme:
              GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme),
        ),
        home: HomePage(),
      ),
    );
  }
}
