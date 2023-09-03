import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_filter.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_result_list.dart';

import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../../../../core/presentation/widgets/loading.dart';
import '../../../../../../core/util/globals.dart';
import '../../../../data/models/place_search_model.dart';
import '../../../bloc/place_search_bloc.dart';

class PlaceSearchBody extends StatefulWidget {
  PlaceSearchBody({
    super.key,
  });

  @override
  State<PlaceSearchBody> createState() => _PlaceSearchBodyState();
}

class _PlaceSearchBodyState extends State<PlaceSearchBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding / 2),
          child: BlocBuilder<PlaceSearchBloc, PlaceSearchState>(
              builder: (context, state) {
            if (state is PlaceSearchFetchFailure) {
              return Failure(
                  errorMessage: state.errorMessage,
                  onPressed: () => context
                      .read<PlaceSearchBloc>()
                      .add(PlaceSearchInitiated()));
            } else if (state is PlaceSearchFetchSuccess) {
              return SearchResultList(places: state.places);
            }
            return const Loading();
          }),
        )),
        Hero(tag: 'filter', child: SearchFilter(color: Color(primary))),
      ],
    );
  }
}
