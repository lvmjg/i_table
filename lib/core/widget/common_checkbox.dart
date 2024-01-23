import 'package:flutter/material.dart';

class CommonCheckbox extends StatefulWidget {
  const CommonCheckbox({super.key, this.initialValue = false, this.onValueFalse, this.onValueTrue});

  final bool initialValue;
  final VoidCallback? onValueFalse;
  final VoidCallback? onValueTrue;

  @override
  State<CommonCheckbox> createState() => _CommonCheckboxState();
}

class _CommonCheckboxState extends State<CommonCheckbox> {

  late bool value;


  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (newValue){
      setState(() {
        if(newValue!=value) {
          newValue==true ? widget.onValueTrue : widget.onValueFalse;
        }

        value = newValue ?? false;
      });
    });
  }
}
