import 'package:flutter/material.dart';

class RestaurantPlanFloatingActionButton extends StatelessWidget {
  const RestaurantPlanFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(onPressed: (){}, label: Icon(Icons.book_rounded, color: Colors.white), icon: Text('Rezerwuj') ,);
  }
}