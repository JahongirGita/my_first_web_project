import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  LoginTextField({super.key,required this.controller,required this.hintText,required this.icon});
  TextEditingController controller;
  String hintText;
  IconData icon;



  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: (value){
        if (value !=  widget.controller.text) {
          int cursorPos =  widget.controller.selection.baseOffset;
          if (value.length <  widget.controller.text.length) {
            widget.controller.value = TextEditingValue(
              text: value,
              selection: TextSelection.collapsed(offset: cursorPos),
            );
          }
        }
      },
      decoration: InputDecoration(
          prefixIcon: Icon(widget.icon,color: Color(0xFF9AA0AC),),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Color(0xFF9AA0AC)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFDFDFE1),width: 1),
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFB4C9EA),width: 2),
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );
  }
}
