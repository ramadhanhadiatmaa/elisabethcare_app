import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image, title, desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 240,
            height: 240,
            image: AssetImage(image),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
