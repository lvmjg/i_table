import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_table/core/util/globals.dart';
import 'package:panorama/panorama.dart';

import '../../../../../../core/presentation/widgets/failure.dart';
import '../../../bloc/panorama_bloc.dart';

class PanoramaBody extends StatelessWidget {
  final String restaurantId;
  final String elementId;

  const PanoramaBody({
    super.key,
    required this.restaurantId,
    required this.elementId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PanoramaBloc, PanoramaState>(
      builder: (context, state) {
        if (state is PanoramaFetchFailure) {
          return Failure(
              errorMessage: errorShowPreview,
              onPressed: () => context.read<PanoramaBloc>().add(PanoramaInit(
                  restaurantId: restaurantId, elementId: elementId)));
        } else if (state is PanoramaFetchInProgress) {
          return SizedBox(
              child: Center(
                  child: CircularProgressIndicator(color: Color(primary))));
        } else if (state is PanoramaFetchSuccess) {
          return Panorama(
            animSpeed: 1.0,
            hotspots: [
              Hotspot(
                  latitude: 0.0,
                  longitude: 160.0,
                  width: 90.0,
                  height: 75.0,
                  widget: Container(
                      color: Colors.white,
                      child: Text(
                        "Bar",
                        style: TextStyle(color: Colors.deepPurple),
                      ))),
            ],
            child: Image.asset('assets/pan.jpg'),
          );
        }

        return Container();
      },
    );
  }
}
