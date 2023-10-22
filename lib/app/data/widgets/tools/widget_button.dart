import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWid extends StatelessWidget {
  const ButtonWid({
    super.key,
    required this.press,
    required this.text,
    required this.color,
  });

  final VoidCallback press;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          )),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
