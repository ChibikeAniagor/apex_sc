//  {
//         //NB: screen names below are exactly as stated in the figma file.

//         // Splash Screen
//         "SplashScreen": (context)=> const SplashScreen(),
//         // Onboarding Screens
//         "Onboarding": (context)=> const OnboardingScreen1(),
//         //Sign in Screen
//         "Signin": (context)=> const SigninScreen(),
//         // password recovery Screens
//           "Password Recovery": (context)=> const PasswordRecovery(),
//           "Verifiy Identity": (context)=> const VerfifyIdentity(),   
//           "Reset Password": (context)=> const ResetPassword(),
//         // Sign Up Screen 
//          "Signup": (context)=> const SignupScreen(),
//          // OTP Authentication Screen
//           "Otp": (context)=> const OtpScreen(),
//         // Id Screen (Identification Screen)
//          "Id": (context)=> const IdScreen(),
//          // Create Pin Screen 
//           "Create pin": (context)=> const SigninScreen(),
          
//              }







































// Scaffold(
//       body: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 100,
//                     left: 0,
//                     right: 0,
//                     child: Image.asset(
//                       "assets/images/card_phone1.jpg",
//                       height: 400,
//                       width: double.infinity,
//                     )),
//                 Positioned(
//                   // top: 10,
//                   // right: 500,
//                   // left: 100,
//                   // bottom: 5,
//                   child: Image.asset(
//                     "assets/images/actual_stack1.png",
//                     height: 400,
//                     width: double.infinity,
//                     // repeat: ImageRepeat.noRepeat,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const Positioned(
//                     top: 290,
//                     left: 0,
//                     right: 0,
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16.0, vertical: 60),
//                       child: Text(
//                         "Finance app the safest \n     and most trusted",
//                         style: TextStyle(
//                             fontStyle: FontStyle.italic,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w800,
//                             fontSize: 34),
//                       ),
//                     )),
//                 const Positioned(
//                   top: 270,
//                   left: 0,
//                   right: 0,
//                   child: const Text(
//                     "Your finance work starts here. We're here to help \n       "
//                     "you "
//                     "track and deal with speeding up your\n "
//                     "                               "
//                     "transactions.",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.white,
//     );