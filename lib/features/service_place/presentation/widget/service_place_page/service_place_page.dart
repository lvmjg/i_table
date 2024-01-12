import 'package:flutter/material.dart';
import 'package:i_table/features/user_actions/presentation/widget/user_actions_page/user_actions_page.dart';
import 'package:i_table/features/user_reservations/presentation/widget/user_reservations_page/user_reservations_page.dart';

import '../../../../place_entry/presentation/widget/place_entry_page/place_entry_page.dart';

class ServicePlacePage extends StatelessWidget {
  const ServicePlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth <= 600){
          return UserActionsPage();
        }
        else{
          return Row(
            children: [
              Expanded(child: Navigator(
                onGenerateRoute: (settings) {
                  return new MaterialPageRoute(builder: (context) {
                    return UserActionsPage();
                  });
                },
              )),
              Expanded(child: Navigator(
                onGenerateRoute: (settings) {
                  return new MaterialPageRoute(builder: (context) {
                    return PlaceEntryPage(placeId: '9wtiLFlRdZ1b8abbPoet');
                  });
                },
              ))
            ],
          );
        }
      },
    );
  }
}
