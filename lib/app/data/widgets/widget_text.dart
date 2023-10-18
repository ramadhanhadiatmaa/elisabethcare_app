import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWid extends StatelessWidget {
  const TextWid({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    this.weight,
    this.align,
  });

  final String text;
  final double size;
  final Color color;
  final FontWeight? weight;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: GoogleFonts.lato(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
