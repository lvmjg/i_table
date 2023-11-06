import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';
import '../../../../../../core/widget/simple_filled_tonal_button.dart';
import '../../../../../place_entry/presentation/widget/place_entry_page/place_entry_page.dart';

class ReserveButton extends StatelessWidget {
  final String placeId;

  ReserveButton({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return SimpleFilledTonalButton(title: reserve, iconData: Icons.book_rounded, iconColor: Colors.black87, onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceEntryPage(placeId: placeId)));
    });
  }
}
