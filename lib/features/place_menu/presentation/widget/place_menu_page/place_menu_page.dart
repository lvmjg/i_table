import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:i_table/features/place_menu/presentation/widget/place_menu_page/place_menu_floating_action_button/place_menu_floating_action_button.dart';

import '../../../../../core/util/snack_bar_util.dart';
import '../../../../home/presentation/widget/home_page/home_page.dart';
import '../../bloc/place_menu_bloc.dart';
import 'app_bar/place_menu_app_bar.dart';
import 'body/place_menu_body.dart';

class PlaceMenuPage extends StatefulWidget {
  final String placeId;
  final String? reservationId;

  const PlaceMenuPage({Key? key, required this.placeId, this.reservationId})
      : super(key: key);

  @override
  State<PlaceMenuPage> createState() => _PlaceMenuPageState();

  bool get menuInReservationMode => reservationId != null;
}

class _PlaceMenuPageState extends State<PlaceMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: BlocConsumer<PlaceMenuBloc, PlaceMenuState>(
        listener: (context, state) {
          if (state is PlaceMenuSubmitOrderSuccess) {
            Navigator.of(this.context).pop();
            Navigator.of(this.context).pop();
            SnackBarUtil.showSnackBar(this.context, submitOrderSuccess);
          }
        },
        builder: (context, state) {
          bool success = state is PlaceMenuFetchSuccess;
          int numberOfCategories =
              success ? state.placeMenu.placeMenuCategories.length : 1;

          return DefaultTabController(
            length: numberOfCategories,
            child: Scaffold(
              appBar: PlaceMenuAppBar(
                  placeMenuCategories: success
                      ? (state as PlaceMenuFetchSuccess)
                          .placeMenu
                          .placeMenuCategories
                      : []),
              body: PlaceMenuBody(
                  menuInReservationMode: widget.menuInReservationMode),
              floatingActionButton: widget.menuInReservationMode
                  ? PlaceMenuFloatingActionButton()
                  : null,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PlaceMenuBloc>().add(PlaceMenuInitiated(
        userId: loggedUserId,
        placeId: widget.placeId,
        placeName: '147 Break',
        reservationId: widget.reservationId));
  }
}
