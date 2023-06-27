import 'package:flutter/material.dart';

import '../../../../../../core/util/globals.dart';

class PanoramaFloatingActionButton extends StatelessWidget {
  const PanoramaFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Text(closePreview),
        label: Icon(Icons.close_rounded, color: Colors.white,)
    );
  }
}