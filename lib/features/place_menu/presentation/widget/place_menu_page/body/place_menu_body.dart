import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_filter.dart';
import 'package:i_table/features/place_search/presentation/widgets/search_page/body/search_result_list.dart';

import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../../../../core/presentation/widgets/loading.dart';
import '../../../../../../core/util/globals.dart';
import '../../../bloc/place_menu_bloc.dart';

class PlaceMenuBody extends StatefulWidget {
  PlaceMenuBody({
    super.key,
  });

  @override
  State<PlaceMenuBody> createState() => _PlaceMenuBodyState();
}

class _PlaceMenuBodyState extends State<PlaceMenuBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceMenuBloc, PlaceMenuState>(
      builder: (context, state) {
        if(state is PlaceMenuFetchSuccess) {
          return TabBarView(
                children: [
                  for (final c in state.placeMenu.placeMenuCategories)
                    ListView.builder(
                      itemCount: c.items.length,
                        itemBuilder: (context, index) {
                          return Text(c.items[index].name);
                        }
                    )
                ],
              );

        }
        return Container();
      },
    );



  }
}
