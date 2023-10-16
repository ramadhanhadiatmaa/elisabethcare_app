import 'package:elisabeth_care/app/modules/onboard/controllers/onboard_controller.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      right: 10,
      child: TextButton(
        onPressed: () => OnboardController().instance.skipPage(),
        child: const Text(
          "Skip",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
