import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_screen1.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  void _onPageChanged(int index) {
    setState(() {
      onLastPage = (index == 1); // Assuming there are 2 pages (index 0 and 1)
    });
  }

  Future<void> _onLastPageAction(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("ON_BOARDING", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: _onPageChanged,
            children: const [
              OnboardingScreen1(),
              OnboardingScreen2(),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 16,
            child: Visibility(
              visible: !onLastPage,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 130,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              child: SmoothPageIndicator(
                controller: _controller,
                count: 2,
                effect: const ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 18,
                  dotColor: Colors.black38,
                  activeDotColor: Color.fromARGB(225, 17, 24, 39),
                  spacing: 6,
                  expansionFactor: 2.5,
                ),
              ),
            ),
          ),
          if (onLastPage)
            Positioned(
              top: 730,
              bottom: MediaQuery.of(context).size.height * 0.0,
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      width: 350,
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: buttonActiveColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onTap: () => _onLastPageAction(context),
                  ),
                ],
              ),
            ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}


























// import 'package:apex_sc/screens/sign_up.dart';
// import 'package:apex_sc/utils/color_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'onboarding_screen1.dart';
// import 'onboarding_screen2.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   final PageController _controller = PageController();
//   bool onLastPage = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _controller,
//             onPageChanged: (index) {
//               setState(() {
//                 onLastPage = (index == 1);
//               });
//             },
//             children: const [
//               OnboardingScreen1(),
//               OnboardingScreen2(),
//             ],
//           ),
//           Positioned(
//             top: MediaQuery.of(context).padding.top + 16,
//             right: 16,
//             child: Visibility(
//               visible: !onLastPage,
//               child: GestureDetector(
//                 onTap: () {
//                   _controller.jumpToPage(1);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   child: const Text(
//                     "Skip",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 19,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: MediaQuery.of(context).padding.bottom + 130,
//             left: 0,
//             right: 0,
//             child: Container(
//               alignment: Alignment.center,
//               child: SmoothPageIndicator(
//                 controller: _controller,
//                 count: 2,
//                 effect: const ExpandingDotsEffect(
//                   dotHeight: 12,
//                   dotWidth: 18,
//                   dotColor: Colors.black38,
//                   activeDotColor: Color.fromARGB(225, 17, 24, 39),
//                   spacing: 6,
//                   expansionFactor: 2.5,
//                 ),
//               ),
//             ),
//           ),
//           onLastPage
//               ? Positioned(
//                   top: 730,
//                   bottom: MediaQuery.of(context).size.height * 0.0,
//                   left: 16,
//                   right: 16,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 350,
//                         height: 60,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: buttonActiveColor,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: const Text(
//                           "Get Started",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : Positioned(
//                   top: 730,
//                   bottom: MediaQuery.of(context).size.height * 0.0,
//                   left: 16,
//                   right: 16,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       GestureDetector(
//                         child: Container(
//                           width: 350,
//                           height: 60,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                               color: buttonActiveColor,
//                               borderRadius: BorderRadius.circular(15)),
//                           child: const Text(
//                             "Get Started",
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         onTap: () {
//                           _controller.nextPage(
//                               duration: Duration(milliseconds: 500),
//                               curve: Curves.ease);
//                         },
//                       ),
//                     ],
//                   ),
//                 )
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }

// void onLastPage(context) async {
//   final prefs = await SharedPreferences.getInstance();
//   await prefs.setBool("ON_BOARDING", false);
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => const SignUp()),
//   );
// }
