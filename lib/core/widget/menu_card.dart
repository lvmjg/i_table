import 'package:flutter/material.dart';
import 'package:i_table/core/widget/common_card.dart';

import '../../features/place_menu/domain/entity/place_menu_item.dart';
import '../util/globals.dart';
import 'menu_card_buttons.dart';

class MenuCard extends StatelessWidget {
  final PlaceMenuItem placeMenuItem;
  final bool buttonsEnabled;
  final VoidCallback? onPressed;

  const MenuCard({Key? key, required this.placeMenuItem, this.buttonsEnabled = true, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        onPressed: onPressed,
        outerPadding: padding/2,
        child: Column(
          children:[
            Visibility(
              visible: placeMenuItem.url!=null,
              child: Padding(
                padding: EdgeInsets.all(padding/2),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: Image.network( placeMenuItem.url ?? 'https://thekebabshop.com/wp-content/uploads/2023/04/Web-Wrap.png'),
                ),
              ),
            ),

          Row(
            mainAxisAlignment: buttonsEnabled ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
            children: [
              Text(placeMenuItem.name, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(width: padding),
              Text('${placeMenuItem.price.toString()} zł', style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              Visibility(
                  visible: buttonsEnabled,
                  child:
                Expanded(child:
                  MenuCardButtons(placeMenuItem: placeMenuItem)
                )
              )
            ],
          ),
          SizedBox(height: padding),
          Text(placeMenuItem.description, style: Theme.of(context).textTheme.bodySmall),
          ],
        )
    );
  }
}
