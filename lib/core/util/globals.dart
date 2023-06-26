import 'package:flutter/cupertino.dart';

bool debug = true;

int TEST_TIMEOUT = 0;

int primary = 0xFF2028FF;
double padding =16.0;

double elevation = 20;
double toolbarHeight = 70;

String appName = 'iTable';
String searchBarHint = 'Szukaj punktu...';
String noResults = 'Brak wyników';
String openingHours = 'Godziny otwarcia';
String chooseRestaurant = 'Wybierz punkt, aby dokonać rezerwacji';
String reserve = 'Rezerwuj';
String chooseDate = 'Wybierz termin';
String chooseTime = 'Wybierz godzinę';
String closePreview = 'Zamknij podgląd';

String imageExtension = '.jpg';

String errorFetchRestaurants = 'Nie można pobrać listy punktów';
String errorFetchRestaurantDetails = 'Nie można pobrać informacji o punkcie';
String errorShowPreview = 'Nie można wyświetlić podglądu miejsca';
String errorFetchRestaurant = 'Nie załadować poglądu punktu';
String tryAgain = 'Spróbuj ponownie';

String RESTAURANT_ID = 'restaurantId';
String RESTAURANTS = 'restaurants';
String RESTAURANTS_DETAILS = 'restaurantsDetails';
String RESTAURANTS_CONFIGURATIONS = 'restaurantsConfigurations';
String RESTAURANTS_PLANS = 'restaurantsPlans';
String RESTAURANT_PLAN_LEVELS = 'restaurantPlanLevels';
String RESTAURANTS_RESERVATIONS = 'restaurantPlanLevels';
String RESERVATION_START = 'restaurantPlanLevels';
String RESERVATION_END = 'restaurantPlanLevels';
String PANORAMAS = 'panoramas';


const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(

    borderRadius: BorderRadius.all(Radius.circular(16))
);