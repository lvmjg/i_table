import 'package:flutter/material.dart';
import '../../../search/presentation/widgets/search_bar.dart';

class HomeBody extends StatelessWidget{
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'iTable',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        Hero(
            tag: 'search_bar',
            child: SearchBar(
              isOnRestaurantSearchPage: false,
            ))
      ],
    );
  }

}