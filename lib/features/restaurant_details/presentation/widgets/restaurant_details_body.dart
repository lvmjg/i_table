import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/domain/entity/restaurant_opening_hours_entity.dart';
import 'package:i_table/features/restaurant_details/domain/entity/restaurant_details_entity.dart';
import 'package:i_table/features/restaurant_plan/presentation/restaurant_plan_page.dart';
import 'package:unicons/unicons.dart';
import '../../../../core/util/globals.dart';
import '../../../../core/util/hex_color.dart';
import '../../../../core/util/url_manager.dart';
import '../bloc/restaurant_details_bloc.dart';

class RestaurantDetailsBody extends StatefulWidget {
  const RestaurantDetailsBody({
    super.key,
    required this.restaurantId,
  });

  final String restaurantId;

  @override
  State<RestaurantDetailsBody> createState() => _RestaurantDetailsBodyState();
}

class _RestaurantDetailsBodyState extends State<RestaurantDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantDetailsBloc, RestaurantDetailsState>(
      builder: (context, state) {
        if (state is RestaurantDetailsFetchInProgress) {
          return SizedBox(
              child: Center(
                  child: CircularProgressIndicator(
                      color: Color(primary))));
        }
        else if(state is RestaurantDetailsFetchSuccess) {
          RestaurantDetailsEntity restaurantDetails = state.restaurantDetails;

          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: Image.asset('assets/logo.png'),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    Text(
                      restaurantDetails.restaurantName,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: padding/2,
                    ),
                    Text(
                      restaurantDetails.restaurantAddress.toString(),
                      style: TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w200, decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    Padding(
                      padding: EdgeInsets.all(padding),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Text(
                            restaurantDetails.restaurantDescription,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    Text(
                      openingHours,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(padding, 0, padding, padding),
                      child: Wrap(alignment: WrapAlignment.center, children: getOpeningHours(restaurantDetails.restaurantOpeningHours)),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, padding),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          shape: CircleBorder(),
                          elevation: 15,
                          child: InkWell(
                            onTap: () {
                              launch(restaurantDetails.restaurantUrl);
                            },
                            child: Ink(
                              color: Color(primary),
                              child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    UniconsLine.globe,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: ElevatedButton.icon(
                            icon: Padding(
                              padding: EdgeInsets.all(padding),
                              child: Text('Rezerwacja'),
                            ),
                            label: Icon(
                              Icons.book_rounded,
                              color: Colors.white,
                              //  size: 10,
                            ),
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 0, color: Colors.white),
                                backgroundColor: Color(primary),
                                shape: RoundedRectangleBorder(
                                  // side: BorderSide.,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(200)))),
                            onPressed: () {
                             Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantPlanPage()));
                            })),
                    Expanded(
                        flex: 2,
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          shape: CircleBorder(),
                          elevation: 15,
                          child: InkWell(
                            onTap: () {
                              launch(restaurantDetails.restaurantLocationUrl);
                            },
                            child: Ink(
                              color: Color(primary),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              )
            ],
          );
        }

        return Text('none');
      },
    );
  }

 List<Widget> getOpeningHours(RestaurantOpeningHoursEntity restaurantOpeningHours) {
    List<String> workDays = [];
    workDays.add('Pn ${restaurantOpeningHours.monday.open}-${restaurantOpeningHours.monday.close}');
    workDays.add('Wt ${restaurantOpeningHours.tuesday.open}-${restaurantOpeningHours.tuesday.close}');
    workDays.add('Śr ${restaurantOpeningHours.wednesday.open}-${restaurantOpeningHours.wednesday.close}');
    workDays.add('Czw ${restaurantOpeningHours.thursday.open}-${restaurantOpeningHours.thursday.close}');
    workDays.add('Pt ${restaurantOpeningHours.friday.open}-${restaurantOpeningHours.friday.close}');
    workDays.add('Sb ${restaurantOpeningHours.saturday.open}-${restaurantOpeningHours.saturday.close}');
    workDays.add('Nd ${restaurantOpeningHours.sunday.open}-${restaurantOpeningHours.sunday.close}');

    return workDays
        .map((e) => Padding(
              padding: EdgeInsets.all(2),
              child: Chip(
                label: Text(e),
                backgroundColor: HexColor("#f2f2f2"),
              ),
            ))
        .toList();
  }


@override
  void initState() {
    super.initState();
    context.read<RestaurantDetailsBloc>().add(
        RestaurantDetailsInit(restaurantId: widget.restaurantId));
  }
}