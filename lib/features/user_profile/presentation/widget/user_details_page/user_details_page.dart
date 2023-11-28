import 'package:flutter/material.dart';
import 'package:i_table/features/home/presentation/widget/home_page/app_bar/home_app_bar.dart';

import '../../../../../core/util/globals.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(title: 'Użytkownik'),
      body: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('Imię',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('Jan',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('Nazwisko',
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Text('Godlewski',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
      ),
    );
  }
}
