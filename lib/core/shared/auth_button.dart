import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String label;
  VoidCallback? onTap;
   CustomAuthButton({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: const Color(0xFF0ACF83),
        ),
        child:  Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
