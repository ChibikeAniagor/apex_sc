import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 150),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/onboarding1.png",
              height: 300,
              cacheWidth: 400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Finanace App the safest \n      and most trusted",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25),
          ),
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Text(
              "Your finance work starts here, We're here\n  to help you track and deal with speeding \n  up your transactions ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
