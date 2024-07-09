import 'package:apex_sc/screens/create_pin.dart';
import 'package:apex_sc/screens/get_started.dart';
import 'package:apex_sc/screens/identity_screen.dart';
import 'package:apex_sc/screens/onboarding_scree.dart';
import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/screens/password_recovery.dart';
import 'package:apex_sc/screens/reset_passwrd.dart';
import 'package:apex_sc/screens/sign_in.dart';
import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/screens/splash_screen.dart';
import 'package:apex_sc/screens/verify_your_identity.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        //NB: screen names below are exactly as stated in the figma file.

        // Splash Screen
        "SplashScreen": (context) => const SplashScreen(),
        // Onboarding Screens
        "Onboarding": (context) => const OnboardingScreen(),
        // //Sign in Screen
        "Signin": (context) => const SignIn(),
        // password recovery Screens
        "Password Recovery": (context) => const PasswordRecovery(),
        // reset your password
        "Reset Password": (context) => const ResetPasswrd(),
        // Sign Up Screen
        "Signup": (context) => const SignUp(),
        // OTP Authentication Screen
        "Otp": (context) => const OtpScreen(),
        // Id Screen (Identification Screen)
        "Verify Id": (context) => const VerifyYourIdentity(),
        //Reset your Password
        "Identity Screen": (context) => const IdentityScreen(),
        // Create Pin Screen
        "Create pin": (context) => const CreatePin(),
        //confirmation screen
        "Confirmation Screen": (context) => const GetStarted(),
      },
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
