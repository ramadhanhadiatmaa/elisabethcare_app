import 'package:flutter/material.dart';

import '../../constants/assets_string.dart';
import '../../constants/color.dart';
import 'widget_text.dart';

class LogoWid extends StatelessWidget {
  const LogoWid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                iLogo,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const TextWid(
          text: "Elisabeth Care",
          size: 24,
          color: cBlue,
          weight: FontWeight.w900,
        ),
      ],
    );
  }
}
