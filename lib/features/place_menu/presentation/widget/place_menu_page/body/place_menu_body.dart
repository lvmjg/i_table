import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/widget/menu_card.dart';

import '../../../bloc/place_menu_bloc.dart';

class PlaceMenuBody extends StatefulWidget {
  final bool menuInReservationMode;

  PlaceMenuBody({
    super.key, required this.menuInReservationMode,
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
                    Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: c.items.length,
                              itemBuilder: (context, index) {
                                return MenuCard(placeMenuItem: c.items[index], buttonsEnabled: widget.menuInReservationMode, onPressed: (){});
                              }
                          ),
                        ),
                      ],
                    )
                ],
              );

        }
        return Container();
      },
    );



  }
}
