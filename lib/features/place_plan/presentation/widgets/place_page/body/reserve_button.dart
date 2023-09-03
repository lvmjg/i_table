import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/place_bloc.dart';

class ReserveButton extends StatelessWidget {
  const ReserveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceBloc, PlaceState>(
      builder: (context, state) {
        bool readyToReserve = false;
        if(state is PlaceFetchSuccess){
          readyToReserve = (state as PlaceFetchSuccess).readyToReserve;
        }

        return Opacity(
          opacity: _setButtonAlpha(readyToReserve),
          child: FloatingActionButton(
              onPressed: _enableButton(readyToReserve, context),
              child: Icon(
                Icons.book_rounded,
                color: Colors.white,
              )),
        );
      },
    );
  }

  VoidCallback? _enableButton(bool readyToReserve, BuildContext buildContext){
    if(readyToReserve){
      return () => buildContext.read<PlaceBloc>().add(PlaceReservationRequest());
    }
    else{
      return null;
    }
  }

  double _setButtonAlpha(bool readyToReserve) {
    if(readyToReserve){
      return 1;
    }
    else{
      return 0.5;
    }
  }
}
