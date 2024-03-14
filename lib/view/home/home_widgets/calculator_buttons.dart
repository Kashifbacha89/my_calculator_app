import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButtons extends StatelessWidget {
  const CalculatorButtons(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTextColor,
      required this.radius,
      required this.onTapped});
  final String buttonText;
  final Color buttonColor;
  final Color buttonTextColor;
  final double radius;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(6.0),
    child: GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),

        ),
        child: Center(
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              color: buttonTextColor,
              fontSize: 28,
            ),
          ),
        ),
      ),
    ),

    );

  }
}
