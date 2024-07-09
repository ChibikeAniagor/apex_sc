import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});

  @override
  State<OnboardingScreen2> createState() => _OnboardingScreen2State();
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 125),
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/onboard2.jpg",
              height: 390,
              cacheWidth: 400,
            ),
          ),
          const Text(
            "The fastest transaction \n       process only here",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w800, fontSize: 25),
          ),
          const Padding(
            padding: EdgeInsets.all(13.0),
            child: Text(
              "Get easy to pay all your bills with just a few \nsteps. Paying "
              "your bills becomes fast and \n                            "
              "   efficient.",
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
