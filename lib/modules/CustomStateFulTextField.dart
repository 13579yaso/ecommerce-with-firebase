import 'package:flutter/material.dart';
class CustomStateFulTextField extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  CustomStateFulTextField({required this.label,this.controller});

  @override
  State<CustomStateFulTextField> createState() => CustomStateFulTextFieldState();
}

class CustomStateFulTextFieldState extends State<CustomStateFulTextField> {

  Color greyColor =const Color(0xffA71E27);
  bool secure=true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: secure,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        suffixIcon: InkWell(
          onTap: (){
            setState((){
              secure=!secure;
            });
          },
          child:
          Icon(
              color: Colors.grey,
              secure
                  ?
              Icons.visibility_off_outlined
                  :
              Icons.visibility
          ),
        ),
        labelText: widget.label,
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
