import 'package:elisabeth_care/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:flutter/material.dart';

import '../../constants/color.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 20,
      child: ElevatedButton(
        onPressed: () => OnboardController().instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: cBlue,
        ),
        child: const Padding(
          padding: EdgeInsets.all(15.0),
          child: Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
