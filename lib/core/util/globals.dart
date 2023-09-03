import 'package:flutter/cupertino.dart';

bool debug = true;

int TEST_TIMEOUT = 0;

int primary = 0xFF0020F7;
int secondary = 0xFFFFCB00;
double padding =16.0;

double elevation = 1;
double toolbarHeight = 70;

String loggedUserId = 'TestUser';

String appName = 'TuSiedzę';
String searchBarHint = 'Szukaj punktu...';
String noResults = 'Brak wyników';
String openingHours = 'Godziny otwarcia';
String choosePlace = 'Wybierz punkt, aby dokonać rezerwacji';
String reserve = 'Rezerwuj';
String chooseDate = 'Wybierz termin';
String chooseTime = 'Wybierz godzinę';
String chooseDuration = 'Wybierz czas trwania';
String closePreview = 'Zamknij podgląd';
String choosePlaces = 'Wybierz miejsca';
String myReservations = 'Moje rezerwacje';
String myProfile = 'Mój profil';
String settings = 'Ustawienia';
String remove = 'Usuń';
String add = 'Dodaj';

String imageExtension = '.jpg';

String errorFetchPlaceMenu = 'Nie można pobrać menu';
String errorFetchUserReservations = 'Nie można pobrać listy rezerwacji';
String errorFetchPlaces = 'Nie można pobrać listy punktów';
String errorFetchPlaceDetails = 'Nie można pobrać informacji o punkcie';
String errorShowPreview = 'Nie można wyświetlić podglądu miejsca';
String errorFetchPlace = 'Nie załadować poglądu punktu';
String errorFetchPlaceSettings = 'Nie można ustawień punktu';
String tryAgain = 'Spróbuj ponownie';

String pathPlaceId = 'placeId';
String pathUserId = 'userId';
String pathPlaces = 'places';
String pathPlacesDetails = 'placesDetails';
String pathPlacesSettings = 'placesSettings';
String pathPlacesPlans = 'placesPlans';
String pathPlacePlanLevels = 'placePlanLevels';
String pathPlacesReservations = 'placesReservations';
String pathStartDate = 'startDate';
String pathPanoramas = 'panoramas';
String pathPlaceMenu = 'placeMenu';

String errorPickedDateAfter = "Rezerwację można złożyć na maksymalnie %d dni wcześniej";
String errorPickedDateBefore = "Nie można złożyć rezerwacji z terminem w przeszłości";
String placeNotWorkingHours = "Punkt nie pracuje w wybranej godzinie";
String placeClosed = 'Nieczynne';

String ok = 'OK';

String menu = 'Menu';

const RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(

    borderRadius: BorderRadius.all(Radius.circular(16))
);