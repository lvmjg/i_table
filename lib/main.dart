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
import 'features/home/presentation/widget/home_page/home_page.dart';
import 'features/panorama/presentation/bloc/panorama_bloc.dart';
import 'features/place_details/presentation/bloc/place_details_bloc.dart';
import 'features/place_menu/presentation/bloc/place_menu_bloc.dart';
import 'features/place_plan/presentation/bloc/place_bloc.dart';
import 'features/place_search/presentation/bloc/place_search_bloc.dart';
import 'features/reservation_chat/presentation/bloc/reservation_chat_bloc.dart';
import 'features/reservation_summary/presentation/bloc/reservation_summary_bloc.dart';
import 'features/service_orders/presentation/bloc/service_orders_bloc.dart';
import 'features/user_orders/presentation/bloc/user_orders_bloc.dart';
import 'features/user_reservations/presentation/bloc/user_reservations_bloc.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //emu "10.0.2.2" 8080
  //pd
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.useFirestoreEmulator('127.0.0.1', 8080);
  firestore.clearPersistence();

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
    OutlineInputBorder defaultInputBorder = const OutlineInputBorder(
        gapPadding: 10,
        borderSide: BorderSide(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(200)));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PlaceSearchBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => PanoramaBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceEntryBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ReservationPickerBloc(
              placeEntryBloc: context.read<PlaceEntryBloc>()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => PlaceBloc(
              reservationPickerBloc: context.read<ReservationPickerBloc>()),
        ),
        BlocProvider(
          create: (context) => UserReservationsBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceMenuBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ReservationSummaryBloc(),
        ),
        BlocProvider(
          create: (context) => ReservationChatBloc(),
        ),
        BlocProvider(
          create: (context) => UserOrdersBloc(),
        ),
        BlocProvider(
          create: (context) => ServiceOrdersBloc(),
        ),
      ],
      child: MaterialApp(
          title: appName,
          //default blue app bar and white background
          theme: ThemeData(
              useMaterial3: true,
              //colorSchemeSeed: Color(primary),
              colorSchemeSeed: primaryColor,
              scaffoldBackgroundColor: Colors.white,
              //primaryColor: Color(primary),
              // primaryColor: Colors.amber,
              //colorScheme: ,
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: primaryColor),
              appBarTheme: AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: primaryColor,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: primaryColor,
                  systemNavigationBarIconBrightness: Brightness.light,
                ),
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                elevation: elevation,
                shape: roundedRectangleBorder,
              ),
              inputDecorationTheme: InputDecorationTheme(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: defaultInputBorder,
                  enabledBorder: defaultInputBorder,
                  focusedBorder: defaultInputBorder,
                  disabledBorder: defaultInputBorder),
              //signika
              //alata
              //lunasima
              textTheme: GoogleFonts.senTextTheme(Theme.of(context).textTheme)
                  ?.copyWith(
                displayLarge: GoogleFonts.josefinSansTextTheme(
                        Theme.of(context).textTheme)
                    .bodySmall
                    ?.copyWith(fontSize: 24),
                headlineMedium:
                    GoogleFonts.senTextTheme(Theme.of(context).textTheme)
                        .headlineMedium
                        ?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            color: Colors.black),
                bodyMedium: GoogleFonts.josefinSansTextTheme(
                        Theme.of(context).textTheme)
                    .bodyMedium
                    ?.copyWith(fontSize: 16),
                bodySmall: GoogleFonts.josefinSansTextTheme(
                        Theme.of(context).textTheme)
                    .bodySmall
                    ?.copyWith(fontSize: 14),
              )

              // GoogleFonts.signikaNegativeTextTheme(Theme.of(context).textTheme),

              ),
          home: debug == false ? SignInPage() : HomePage() //PlaceSearchPage(),
          ),
    );
  }
}
