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
String choosePlace = 'Wybierz punkt, aby dokonać rezerwacji';
String reserve = 'Rezerwuj';
String chooseDate = 'Wybierz termin';
String chooseTime = 'Wybierz godzinę';
String closePreview = 'Zamknij podgląd';

String imageExtension = '.jpg';

String errorFetchPlaces = 'Nie można pobrać listy punktów';
String errorFetchPlaceDetails = 'Nie można pobrać informacji o punkcie';
String errorShowPreview = 'Nie można wyświetlić podglądu miejsca';
String errorFetchPlace = 'Nie załadować poglądu punktu';
String tryAgain = 'Spróbuj ponownie';

String pathPlaceId = 'placeId';
String pathPlaces = 'places';
String pathPlacesDetails = 'placesDetails';
String pathPlacesSettings = 'placesSettings';
String pathPlacesPlans = 'placesPlans';
String pathPlacePlanLevels = 'placePlanLevels';
String pathPlacesReservations = 'placesReservations';
String pathReservationStart = 'reservationStart';
String pathReservationEnd= 'reservationEnd';
String pathPanoramas = 'panoramas';


const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(

    borderRadius: BorderRadius.all(Radius.circular(16))
);