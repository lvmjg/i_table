import 'package:flutter/material.dart';

import '../util/globals.dart';

class MaterialTextFieldExtended extends StatelessWidget {
  MaterialTextFieldExtended(
      {super.key,
      required this.hintText,
      this.icon,
        this.backgroundColor = Colors.white,
      this.enabled = true,
      this.isLoading = false,
      this.onTextChanged,
      this.onIconPressed,
      this.controller});

  final String hintText;
  final IconData? icon;

  final Color backgroundColor;

  final bool enabled;
  final bool isLoading;

  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onIconPressed;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: TextField(
          controller: controller,
          enabled: enabled,
          textAlign: TextAlign.center,
          onChanged: onTextChanged,
          decoration: InputDecoration(
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 50, maxWidth: 50),
              hintText: hintText,
              suffixIcon: _adjustIconBasedOnLoadingState(),
              hintStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget _adjustIconBasedOnLoadingState() {
    if(icon==null) {
      return Container();
    }

    if (isLoading) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: const CircularProgressIndicator(strokeWidth: 3),
      );
    } else {
      return IconButton(
        onPressed: onIconPressed,
        icon: Icon(
          icon,
          color: primaryColor,
        ),
      );
    }
  }
}
