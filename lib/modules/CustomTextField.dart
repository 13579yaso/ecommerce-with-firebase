import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String label;
  final bool secure;
  final TextEditingController? customController;
  CustomTextField({required this.label, this.secure = false,this.customController});

  @override
  Color greyColor = Color(0xffA71E27);

  Widget build(BuildContext context) {
    return TextField(
      controller: customController,
      obscureText: secure,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        floatingLabelStyle: TextStyle(
            color: greyColor
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,

          ),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(
              width: 2,
              color: greyColor

          ),

        ),

      ),
    );
  }

}