import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  TextInputField({
    @required this.hint,
    @required this.onChanged,
    this.textNature,
    this.keypadType,
  });

  final String hint;
  final Function onChanged;
  final bool textNature;
  final dynamic keypadType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keypadType,
      obscureText: textNature,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        hintStyle: TextStyle(
          color: Colors.blue,
        ),
        fillColor: Colors.white30,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
