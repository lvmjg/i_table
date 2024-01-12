import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool debug = true;

int TEST_TIMEOUT = 0;

//Color primaryColor = Color(0xFF0020F7);
//Color primaryColor = Color(0xFF1976D2);
const Color primaryColor = Color(0xFF304FFE);

int secondary = 0xFFFFCB00;
double padding = 16.0;

double elevation = 1;
double toolbarHeight = 70;

String loggedUserId = 'TestUser';
String me = "Ja";

String appName = 'TuJemy';
String searchBarHint = 'Szukaj punktu...';
String messageBarHint = 'Wyślij wiadomość do obsługi...';
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
String myOrders = 'Moje zamówienia';
String myProfile = 'Mój profil';
String settings = 'Ustawienia';
String remove = 'Usuń';
String add = 'Dodaj';
String date = "Data";
String time = "Godzina";
String duration = "Czas";
String submitReservationSuccess = "Rezerwacja złożona pomyślnie! :)";
String submitOrderSuccess = "Zamówienie złożone pomyślnie! :)";

String moreAbout = "Więcej o";
String reservationTerm = "Termin rezerwacji";
String reservationSummary = "Podsumowanie rezerwacji";
String reservationDetails = "Szczegóły rezerwacji";

String orderNo = "Zamówienie";

String sitting = "Miejsce";
String cancel = "Anuluj";
String submit = "Złóż";
String reservation = "Rezerwacja";
String no = "Nr.";
String status = "Status";
String numberOfPeople = "Liczba osób";
String from = "Od";
String dash = "-";
String color = ":";

String ourPlaces = "Nasze punkty";
String placePlan = "Plan punktu";

String imageExtension = '.jpg';

String chooseSittingsFriendlyRequest = 'Wybierz miejsca\nna planie :)';

String errorFetchPlaceMenu = 'Nie można pobrać menu';
String errorFetchUserReservations = 'Nie można pobrać listy rezerwacji';
String errorFetchPlaces = 'Nie można pobrać listy punktów';
String errorFetchPlaceDetails = 'Nie można pobrać informacji o punkcie';
String errorShowPreview = 'Nie można wyświetlić podglądu miejsca';
String errorFetchPlace = 'Nie załadować poglądu punktu';
String errorFetchPlaceSettings = 'Nie można ustawień punktu';
String errorFetchData = "Nie można pobrać danych";
String tryAgain = 'Spróbuj ponownie';

String pathPlaceId = 'placeId';
String pathUserId = 'userId';
String pathReservationId = 'reservationId';
String pathPlaces = 'places';
String pathPlacesDetails = 'placesDetails';
String pathPlacesSettings = 'placesSettings';
String pathPlacesPlans = 'placesPlans';
String pathPlacePlanLevels = 'placePlanLevels';
String pathPlacesReservations = 'placesReservations';
String pathPlacesOrders = "placesOrders";
String pathReservationChat = 'reservationChat';
String pathStartDate = 'startDate';
String pathPanoramas = 'panoramas';
String pathPlaceMenu = 'placeMenu';

String errorPickedDateAfter =
    "Rezerwację można złożyć na maksymalnie %d dni wcześniej";
String errorPickedDateBefore =
    "Nie można złożyć rezerwacji z terminem w przeszłości";
String placeNotWorkingHours = "Punkt nie pracuje w wybranej godzinie";
String placeClosed = 'Nieczynne';

String ok = 'OK';

String menu = 'Menu';
String serviceChat = 'Chat z obsługą';

String payLater = 'Zapłać później';
String payNow = 'Zapłać teraz';

const RoundedRectangleBorder roundedRectangleBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16)));

String totalCost = "Razem";
String kitchen = "Kuchnia";
String titleOrders = "Zamówienia";
String completed = "Zrealizowane";
String username = "Użytkownik";

String pleasePrepare = "Proszę o przygotowanie:";
String thankYou = "Dziekuję";

String pathStorageMenu = 'menu';
String pathStorageLogo = 'logo';
String chosenSittings = 'Wybrane miejsca';
String settlement = 'Rozliczenie';

String table = "Stolik";
String sittingGroup = 'Grupa miejsc';
String aloneSittings = 'Pojedyncze miejsce';
String allSittings = 'Wszystkie miejsca';
String lp = '(';
String rp = ')';
String dot = '.';
String colon = ':';
String comma = ',';
String arrow = '->';
String nl = '\n';
String tab = '\t';

String service = "Obsługa";
String showBasket = "Wyświetl koszyk";
String pay = 'Zapłać';
String total = 'Razem';

String homeResOrd = 'Rez./Zam.';
String homeSearch = 'Szukaj';
String homeSearchTitle = 'Nasze punkty';
String homeProfile = 'Profil';

String reservations = 'Rezerwacje';
String orders = 'Zamówienia';
String newOrder = 'Nowe zamówienie';
String chat = 'Chat';
String history = 'Historia';
String note = "Uwagi";
String order = 'Zamówienie';
String close = 'Zamknij';
String menuTakeaway = 'Na wynos';
String menuOnsite = 'Na miejscu';
String menuTakeawayLowerCase = 'na wynos';
String menuOnsiteLowerCase = 'na miejscu';

String orderStatusNew = 'Nowa';
String orderStatusActive = 'Aktywna';
String orderStatusClosed = 'Zamknięta';
String orderStatusCancelled = 'Anulowana';
String orderNotes = 'Uwagi do zamówienia';
String basket = 'Koszyk';