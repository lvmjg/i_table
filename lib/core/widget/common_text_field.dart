import 'package:flutter/material.dart';
import 'package:i_table/core/util/string_util.dart';

import '../util/globals.dart';

class CommonTextField extends StatefulWidget {
  TextEditingController controller = TextEditingController();
  final ValueChanged<String>? onTextChanged;
  final VoidCallback ?onActionIconPressed;

  final String? text;
  final String? hintText;
  final IconData? iconAction;

  CommonTextField(
      {super.key,
      this.onTextChanged,
        this.onActionIconPressed,
        this.text,
      this.hintText,
      this.iconAction}){
    controller.text = text ?? StringUtil.EMPTY;
  }

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value){
        if(widget.onTextChanged!=null) {
          widget.onTextChanged!(value);
        }

        setState(() {

        });

      },
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints(maxHeight: 50, maxWidth: 50),
          hintText: widget.hintText,
          suffixIcon: _adjustSufixIcon(),
          hintStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w300)),
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
    );
  }

  Widget _adjustSufixIcon() {
    if (widget.controller.text!=StringUtil.EMPTY) {
      return IconButton(
        onPressed: () {
          widget.controller.text = StringUtil.EMPTY;

          if(widget.onActionIconPressed!=null) {
            widget.onActionIconPressed!();
          }
        },
        icon: Icon(
          widget.iconAction,
          color: primaryColor,
        ),
      );
    }

    return Container();
  }
}
