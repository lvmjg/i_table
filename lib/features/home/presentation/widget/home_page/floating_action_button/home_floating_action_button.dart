import 'package:flutter/material.dart';
import 'package:i_table/features/qr_scan/presentation/widget/qr_scan_page.dart';

class HomeFloatingActionButton extends StatelessWidget {
  const HomeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.qr_code_rounded, color: Colors.white),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => QRScanPage()));
        });
  }
}
