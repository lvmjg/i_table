import 'package:flutter/material.dart';

enum MenuCardButtonType {left, right, none}

class MenuCardButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final MenuCardButtonType type;

  const MenuCardButton({super.key, required this.onTap, required this.iconData, this.type = MenuCardButtonType.none});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          size: 15,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: _adjustBorderRadiusBasedOnButtonType()
      ),
    );
  }

  BorderRadius _adjustBorderRadiusBasedOnButtonType(){
    Radius radius = const Radius.circular(10);

    if(type==MenuCardButtonType.left){
      return BorderRadius.only(
          topLeft: radius,
          bottomLeft: radius
      );
    }
    else if(type==MenuCardButtonType.right){
      return BorderRadius.only(
          topRight: radius,
          bottomRight: radius
      );
    }

    return BorderRadius.all(radius);
  }
}
