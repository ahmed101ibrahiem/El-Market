import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  VoidCallback? changePass;
  final TextEditingController controller;
  final IconData iconData;
  final TextInputType keyboaredTybe;
  bool obscureText;
  String? Function(String? val)? validate;
  final int? num;
  IconData? suffixIcon;
  CustomTextField({
    required this.keyboaredTybe,
    required this.controller,
    this.changePass,
    this.validate,
    this.obscureText = false,
    this.suffixIcon,
    required this.label,
    this.num,
    required this.iconData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboaredTybe,
      validator: validate,
      obscureText: obscureText,
      decoration: InputDecoration(
          label: Text(label),
          labelStyle:
          const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          //suffixIcon: Icon(Icons.email,color: kColor),
          border:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          filled: true,
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          suffixIcon: suffixIcon != null
              ? IconButton(
              onPressed: changePass,
              color: Colors.grey,
              icon: Icon(
                suffixIcon,
                size: 24,
              ))
              : null,
          isDense: true,
          prefixIcon: Icon(iconData, color: Colors.grey)),
    );
  }
}
