import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/place_entry/presentation/bloc/place_entry_bloc.dart';
import 'package:i_table/features/reservation_picker/presentation/bloc/reservation_picker_bloc.dart';
import 'features/authentication/presentation/sign_in_page.dart';
import 'features/home/presentation/widgets/home_page/home_page.dart';
import 'features/panorama/presentation/bloc/panorama_bloc.dart';
import 'features/place_details/presentation/bloc/place_details_bloc.dart';
import 'features/place_menu/presentation/bloc/place_menu_bloc.dart';
import 'features/place_plan/presentation/bloc/place_bloc.dart';
import 'features/place_search/presentation/bloc/place_search_bloc.dart';
import 'features/user_reservations/presentation/bloc/user_reservations_bloc.dart';
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
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.useFirestoreEmulator('127.0.0.1', 8080);

  FirebaseAuth auth = FirebaseAuth.instance;
  auth.useAuthEmulator('127.0.0.1', 8080);

  FirebaseStorage storage = FirebaseStorage.instance;
  storage.useStorageEmulator('127.0.0.1', 9199);

  FirebaseFunctions functions = FirebaseFunctions.instance;
  functions.useFunctionsEmulator('127.0.0.1', 5001);

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
        BlocProvider(
          create: (context) => PlaceEntryBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ReservationPickerBloc(placeEntryBloc: context.read<PlaceEntryBloc>()),
        ),
        BlocProvider(
          create: (context) => UserReservationsBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceMenuBloc(),
        ),
      ],
      child: MaterialApp(
        title: appName,
        //default blue app bar and white background
        theme: ThemeData(
          useMaterial3: true,
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
            foregroundColor: Colors.white,
            backgroundColor:  Color(primary),
            elevation: elevation,
            shape: roundedRectangleBorder,
          ),
          textTheme:
              GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme),
        ),
        home: debug == false ? SignInPage() : HomePage()//PlaceSearchPage(),
      ),
    );
  }
}
