import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessState {}

class CommonPage extends StatelessWidget {
  final Bloc? bloc;
  final Widget child;

  const CommonPage({super.key, this.bloc, required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(bloc==null){
          return true;
        }

        return bloc?.state is SuccessState;
      },
      child: child,
    );
  }
}
