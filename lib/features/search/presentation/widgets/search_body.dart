import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/search/presentation/widgets/search_bar.dart';

import '../../../../core/util/globals.dart';
import '../../../restaurant_details/presentation/restaurant_details_page.dart';
import '../../domain/entity/search_entity.dart';
import '../bloc/search_bloc.dart';

class SearchBody extends StatefulWidget {
  SearchBody({
    super.key,
  });

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  late String input;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Color(
            primary), //or set color with: Color(0xFF0000FF)
      ),
      child: Container(
        color: Color(primary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
                tag: 'search_bar',
                child: SearchBar(
                  isOnRestaurantSearchPage: true,
                )),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Card(
                      child: Container(
                        width: double.infinity,
                        child: BlocBuilder<SearchBloc, SearchState>(
                            builder: (context, state) {
                              if (state is SearchFetchFailure) {
                                return Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: Text(
                                    noResults,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              } else if (state is SearchFetchInProgress) {
                                return SizedBox(
                                    child: Center(
                                        child: CircularProgressIndicator(
                                            color: Color(primary))));
                              } else if (state is SearchFetchSuccess) {
                                List<SearchEntity> fetchedRestaurants = state.restaurants;
                                return ListView.builder(
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                        title: Text(
                                            fetchedRestaurants[index].restaurantName),
                                        subtitle: Text(
                                            fetchedRestaurants[index].restaurantAddress),
                                        trailing: InkWell(
                                            onTap: () =>print('test')
                                            // showRestaurantDetails(fetchedRestaurants[index])
                                            ,
                                            child: FittedBox(
                                              fit: BoxFit.fitHeight,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.info_outline_rounded,
                                                  color: Color(primary),
                                                ), onPressed: () {
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RestaurantDetailsPage(restaurantId: fetchedRestaurants[index].restaurantId)));

                                              },

                                              ),
                                            )),
                                        onTap: () => print('ttt')
                                      /*   Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReservationEntryPage(restaurant: null))
                                                      ),

                                    );
                                    */
                                    );
                                  },
                                  itemCount: fetchedRestaurants.length,
                                );
                              }
                              return Text('test');
                            }),
                      )),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    input = '';
  }
}
