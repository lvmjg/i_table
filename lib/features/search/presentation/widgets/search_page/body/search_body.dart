import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/search/presentation/widgets/search_page/body/search_header.dart';
import 'package:i_table/features/search/presentation/widgets/search_page/body/search_restaurant.dart';
import 'package:i_table/features/search/presentation/widgets/search_page/body/search_results_list.dart';

import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../../../../core/presentation/widgets/loading.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../domain/entities/search_entity.dart';
import '../../../bloc/search_bloc.dart';

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
          SearchHeader(),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding / 2),
            child: Card(
                child: Container(
              width: double.infinity,
              child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                if (state is SearchFetchFailure) {
                  return Failure(
                      errorMessage: state.errorMessage,
                      onPressed: () =>
                          context.read<SearchBloc>().add(SearchInit()));
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
