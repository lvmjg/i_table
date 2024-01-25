import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/core/util/string_util.dart';
import 'package:i_table/core/widget/deafult_app_bar.dart';
import 'package:i_table/features/place_entry/presentation/bloc/place_entry_bloc.dart';
import 'package:i_table/features/place_menu/presentation/widget/place_menu_page/place_menu_page.dart';
import 'package:i_table/features/place_search/presentation/widget/search_page/body/place_search_body.dart';
import 'package:i_table/features/place_search/presentation/widget/search_page/place_search_page.dart';
import 'package:i_table/features/reservation_chat/presentation/widget/reservation_chat_page/reservation_chat_page.dart';
import 'package:i_table/features/reservation_picker/presentation/bloc/reservation_picker_bloc.dart';
import 'package:i_table/features/service_orders/domain/usecase/fetch_tomorrows_service_orders.dart';
import 'package:i_table/features/service_orders/presentation/widget/service_orders_page/service_orders_page.dart';
import 'package:i_table/features/service_place/presentation/widget/service_place_page/service_place_page.dart';
import 'package:i_table/features/user_actions/presentation/widget/user_actions_page/user_actions_app_bar/user_actions_app_bar.dart';
import 'package:i_table/features/user_actions/presentation/widget/user_actions_page/user_actions_body/user_actions_body.dart';
import 'package:i_table/features/user_orders/presentation/widget/user_reservation_orders_page/user_reservation_orders_page.dart';
import 'package:i_table/features/user_profile/presentation/widget/user_details_page/user_details_page.dart';
import 'package:i_table/features/user_profile/presentation/widget/user_profile_page/user_profile_body/user_profile_body.dart';
import 'core/place_order/domain/entity/place_orders_factory.dart';
import 'features/panorama/presentation/bloc/panorama_bloc.dart';
import 'features/place_entry/presentation/widget/place_entry_page/place_entry_page.dart';
import 'features/place_menu/presentation/bloc/place_menu_bloc.dart';
import 'features/place_plan/presentation/bloc/place_bloc.dart';
import 'features/place_search/presentation/bloc/place_search_bloc.dart';
import 'features/qr_scan/presentation/widget/qr_scan_page.dart';
import 'features/reservation_summary/presentation/bloc/reservation_summary_bloc.dart';
import 'features/service_orders/data/data_source/service_orders_remote_data_source.dart';
import 'features/service_orders/data/repository/service_orders_repository.dart';
import 'features/service_orders/domain/usecase/fetch_todays_service_orders.dart';
import 'features/service_orders/presentation/bloc/service_orders_bloc.dart';
import 'features/user_orders/data/data_source/user_orders_remote_data_source.dart';
import 'features/user_orders/data/repository/user_orders_repository.dart';
import 'features/user_orders/domain/usecase/fetch_user_orders.dart';
import 'features/user_orders/presentation/bloc/user_orders_bloc.dart';
import 'features/user_reservations/presentation/bloc/user_reservations_bloc.dart';
import 'features/user_reservations/presentation/widget/user_reservations_page/user_reservations_page.dart';
import 'firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

Future<void> main() async {
  SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: []);



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

  runApp(MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class ScaffoldWithNavBar extends StatefulWidget {
  final Widget child;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> showNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
    bool? enable = await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();

    const AndroidInitializationSettings settings = AndroidInitializationSettings('ic_launcher');

    await flutterLocalNotificationsPlugin.initialize(InitializationSettings(android: settings));

    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        '10091', 'name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'ic_noti');
    

    
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    //await flutterLocalNotificationsPlugin.show(20, 'TuJemy', 'Nowe zamówienie 🍴<BKUNYK>', notificationDetails, payload: 'item x');

    await flutterLocalNotificationsPlugin.show(20, 'TuJemy', 'Gotowe do odbioru 🍲 <BKUNYK>', notificationDetails, payload: 'item x');
  }


  ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();

  static const platform = MethodChannel('example.com/channel');
  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/userDashboard')) {
      return 0;
    }
    if (location.startsWith('/placeSearch')) {
      return 1;
    }
    if (location.startsWith('/userProfile')) {
      return 2;
    }
    return 1;
  }
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  List<String> dashboardCategories = [reservations, orders];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _calculateTabCount(context),
      child: Scaffold(
        appBar: _selectAppBar(context),
        body: widget.child,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.qr_code_rounded, color: Colors.white),
            onPressed: () async {
              await Future.delayed(Duration(seconds: 5), () => widget.showNotification());
              //GoRouter.of(context).go('/scanQRCode');
            }),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.book_rounded), label: homeResOrd),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: homeSearch),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: homeProfile),
          ],
          currentIndex: ScaffoldWithNavBar._calculateSelectedIndex(context),
          onTap: (int idx) => _onItemTapped(idx, context),
        ),
      ),
    );
  }

  PreferredSizeWidget _selectAppBar(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final String title = _selectTitle(context);

    if (location.startsWith('/userDashboard')) {
      return UserActionsAppBar(title: title, categories: dashboardCategories);
    }
    return DefaultAppBar(title: title);
  }

  int _calculateTabCount(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/userDashboard')) {
      return dashboardCategories.length;
    }
    return 0;
  }

  String _selectTitle(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location.startsWith('/userDashboard')) {
      return homeResOrd;
    }
    if (location.startsWith('/placeSearch')) {
      return homeSearchTitle;
    }
    if (location.startsWith('/userProfile')) {
      return homeProfile;
    }
    return homeSearch;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/userDashboard');
        break;
      case 1:
        GoRouter.of(context).go('/placeSearch');
        break;
      case 2:
        GoRouter.of(context).go('/userProfile');
        break;
    }
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/placeSearch',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      /// Application shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
              path: '/userDashboard',
              builder: (BuildContext context, GoRouterState state) {
                return UserActionsBody(categories: [reservation, orders]);
              },
              routes: <RouteBase>[
                // The details screen to display stacked on the inner Navigator.
                // This will cover screen A but not the application shell.
             /*   GoRoute(
                  path: 'reservationDetails/:reservationId',
                  name: 'chat',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return ReservationChatPage(
                      placeId: state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                      reservationId: state.pathParameters['reservationId'] ?? StringUtil.EMPTY,
                    );
                  },
                ),*/
                GoRoute(
                  path: 'orders/:reservationId',
                  name: 'orders',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return UserReservationOrdersPage(reservationId: state.pathParameters['reservationId'] ?? StringUtil.EMPTY);
                  },
                ),
                GoRoute(
                  path: 'chat/:placeId/:reservationId',
                  name: 'chat',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return ReservationChatPage(
                      placeId: state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                      reservationId: state.pathParameters['reservationId'] ?? StringUtil.EMPTY,
                    );
                  },
                ),
                GoRoute(
                  path: 'placeMenuOnsite/:placeId/:placeName/:reservationId',
                  name: 'placeMenuOnsite',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return PlaceMenuPage(
                        placeId:
                        state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                        placeName: state.pathParameters['placeName'] ??
                            StringUtil.EMPTY,
                        reservationId: state.pathParameters['reservationId'],
                    );
                  },
                ),
                GoRoute(
                  path: 'order/:placeId/:placeName/:reservationId',
                  name: 'ordre',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (BuildContext context, GoRouterState state) {
                    return PlaceMenuPage(
                      placeId:
                      state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                      placeName: state.pathParameters['placeName'] ??
                          StringUtil.EMPTY,
                      reservationId: state.pathParameters['reservationId'],
                    );
                  },
                ),
              ]),
          GoRoute(
            path: '/placeSearch',
            builder: (BuildContext context, GoRouterState state) {
              return PlaceSearchBody();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: 'reservation/:placeId',
                name: 'reservation',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return PlaceEntryPage(
                    placeId:
                        state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                  );
                },
              ),
              GoRoute(
                path: 'placeMenu/:placeId/:placeName',
                name: 'placeMenu',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return PlaceMenuPage(
                      placeId:
                          state.pathParameters['placeId'] ?? StringUtil.EMPTY,
                      placeName: state.pathParameters['placeName'] ??
                          StringUtil.EMPTY);
                },
              ),
              GoRoute(
                path: 'user_reservations',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return UserReservationsPage();
                },
              ),
              GoRoute(
                path: 'service_orders',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return ServiceOrdersPage();
                },
              ),
              GoRoute(
                path: 'service_place',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return ServicePlacePage();
                },
              ),
              GoRoute(
                path: 'place_search',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return PlaceSearchPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: '/scanQRCode',
            builder: (BuildContext context, GoRouterState state) {
              return const QRScanPage();
            },
          ),
          GoRoute(
            path: '/userProfile',
            builder: (BuildContext context, GoRouterState state) {
              return const UserProfileBody();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: 'userDetails',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const UserDetailsPage();
                },
              ),
              GoRoute(
                path: 'serviceOrders',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ServiceOrdersPage();
                },
              ),
              GoRoute(
                path: 'servicePlace',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return const ServicePlacePage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

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
        BlocProvider<UserAllOrdersBloc>(
          create: (context) => UserOrdersBloc(
            fetchUserOrders: FetchUserOrders(
              UserAllOrdersRepository(
                UserAllOrdersRemoteDataSource(), PlaceOrdersFactory()
              )
            )
          ),
        ),
        BlocProvider(
          create: (context) => UserReservationsBloc(),
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
          create: (context) => PlaceMenuBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => ReservationSummaryBloc(),
        ),
        BlocProvider<ServiceTodaysUncompletedOrdersBloc>(
          create: (context) => ServiceOrdersBloc(fetchUseCase:
          FetchTodaysServiceOrders(
              ServiceOrdersRepositoryImpl(
                  ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()
              ), filterCompleted: false
          )
          ),
        ),
        BlocProvider<ServiceTodaysCompletedOrdersBloc>(
          create: (context) => ServiceOrdersBloc(fetchUseCase:
          FetchTodaysServiceOrders(
              ServiceOrdersRepositoryImpl(
                  ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()
              ), filterCompleted: true
          )
          ),
        ),
        BlocProvider<ServiceTomorrowsUncompletedOrdersBloc>(
          create: (context) => ServiceOrdersBloc(fetchUseCase:
          FetchTomorrowsServiceOrders(
              ServiceOrdersRepositoryImpl(
                  ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()
              ), filterCompleted: false
          )
          ),
        ),
        BlocProvider<ServiceTomorrowsCompletedOrdersBloc>(
          create: (context) => ServiceOrdersBloc(fetchUseCase:
          FetchTomorrowsServiceOrders(
              ServiceOrdersRepositoryImpl(
                  ServiceOrdersRemoteDataSourceImpl(), PlaceOrdersFactory()
              ), filterCompleted: true
          )
          ),
        ),
      ],
      child: MaterialApp.router(
          title: appName,
          routerConfig: _router,
          debugShowCheckedModeBanner: false,
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
                headlineSmall:
                GoogleFonts.senTextTheme(Theme.of(context).textTheme)
                    .headlineSmall
                    ?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    color: Colors.black),
                bodyLarge: GoogleFonts.josefinSansTextTheme(
                    Theme.of(context).textTheme)
                    .bodyMedium
                    ?.copyWith(fontSize: 18),
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

              )),
    );
  }
}
