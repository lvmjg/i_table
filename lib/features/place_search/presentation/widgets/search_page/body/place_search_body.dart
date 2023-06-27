import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_filter.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_header.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_result_list.dart';

import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../../../../core/presentation/widgets/loading.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../domain/entities/place_search_entity.dart';
import '../../../bloc/place_search_bloc.dart';

class PlaceSearchBody extends StatefulWidget {
  PlaceSearchBody({
    super.key,
  });

  @override
  State<PlaceSearchBody> createState() => _PlaceSearchBodyState();
}

class _PlaceSearchBodyState extends State<PlaceSearchBody> {
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
              child: BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
                  builder: (context, state) {
                if (state is PlaceSearchFetchFailure) {
                  return Failure(
                      errorMessage: state.errorMessage,
                      onPressed: () =>
                          context.read<PlaceSearchBloc>().add(PlaceSearchInitiated()));
                } else if (state is PlaceSearchFetchInProgress) {
                  return const Loading();
                } else if (state is PlaceSearchFetchSuccess) {
                  List<PlaceSearchEntity> places = state.places;
                  return SearchResultList(
                      places: places);
                }
                return Container();
              }),
            )),
          )),
          SearchFilter(),
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
