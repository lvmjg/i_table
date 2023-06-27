import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_table/core/util/globals.dart';
import 'features/panorama/presentation/bloc/panorama_bloc.dart';
import 'features/place/presentation/bloc/place_bloc.dart';
import 'features/place_details/presentation/bloc/place_details_bloc.dart';
import 'features/place_search/presentation/bloc/place_search_bloc.dart';
import 'features/place_search/presentation/widgets/search_page/place_search_page.dart';
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

  FirebaseStorage fs = FirebaseStorage.instance;
  fs.useStorageEmulator('127.0.0.1', 9199);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlaceSearchBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceBloc(),
        ),
        BlocProvider(
          create: (context) => PanoramaBloc(),
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
        home: PlaceSearchPage(),
      ),
    );
  }
}
