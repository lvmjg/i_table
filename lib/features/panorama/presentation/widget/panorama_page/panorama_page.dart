import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/globals.dart';
import '../../../../../core/widget/common_page.dart';
import '../../bloc/panorama_bloc.dart';
import 'app_bar/panorama_app_bar.dart';
import 'body/panorama_body.dart';
import 'floating_action_button/panorama_floating_action_button.dart';

class PanoramaPage extends StatefulWidget {
  final String placeId;
  final String elementId;

  const PanoramaPage({Key? key, required this.placeId, required this.elementId})
      : super(key: key);

  @override
  State<PanoramaPage> createState() => _PanoramaPageState();
}

class _PanoramaPageState extends State<PanoramaPage> {
  @override
  Widget build(BuildContext context) {
    return CommonPage(
      bloc: context.read<PanoramaBloc>(),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PanoramaAppBar(title: '$sitting ${widget.elementId}'),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: PanoramaFloatingActionButton(),
          bottomNavigationBar: Container(
            height: 50,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(padding),
                    topRight: Radius.circular(padding))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.elementId,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                  width: padding,
                ),
                Icon(Icons.location_searching_rounded, color: Colors.redAccent)
              ],
            ),
          ),
          body:
              PanoramaBody(placeId: widget.placeId, elementId: widget.elementId)),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<PanoramaBloc>().add(PanoramaInitiated(
        placeId: widget.placeId, elementId: widget.elementId));
  }
}
