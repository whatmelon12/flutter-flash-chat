import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hint;
  final Color accentColor;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  InputField({
    this.hint,
    this.accentColor = Colors.lightBlueAccent,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return  TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: accentColor, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: accentColor, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
