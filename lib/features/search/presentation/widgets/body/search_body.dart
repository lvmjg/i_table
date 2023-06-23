import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/restaurant_plan/presentation/restaurant_plan_page.dart';
import 'package:i_table/features/search/presentation/widgets/body/search_restaurant.dart';

import 'package:i_table/features/search/presentation/widgets/body/search_results_list.dart';

import '../../../../../core/presentation/widgets/loading.dart';
import '../../../../../core/util/globals.dart';
import '../../../../restaurant_details/presentation/restaurant_details_page.dart';
import '../../../domain/entity/search_entity.dart';
import '../../bloc/search_bloc.dart';
import 'choose_restaurant.dart';

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
    return Container(
      color: Color(primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ChooseRestaurant(),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
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
                  return const Loading();
                } else if (state is SearchFetchSuccess) {
                  List<SearchEntity> fetchedRestaurants = state.restaurants;
                  return SearchResultsList(
                      fetchedRestaurants: fetchedRestaurants);
                }
                return Container();
              }),
            )),
          )),
          SearchRestaurant(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    input = '';
  }
}


