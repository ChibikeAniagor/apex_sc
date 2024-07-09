import 'dart:async'; // Add this import

import 'package:apex_sc/screens/identity_screen.dart';
import 'package:apex_sc/screens/onboarding_scree.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String text = "";
  int _seconds = 30; // Add this variable
  Timer? _timer; // Add this variable

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer when the screen is initialized
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _onKeyboardTap(String value) {
    setState(() {
      if (text.length < 5) {
        text = text + value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryBackgroundColor,
          leading: GestureDetector(
              onTap: () {},
              child: Image.asset('assets/icons/backarrow_icon.png')),
        ),
        backgroundColor: primaryBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify It\'s you',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'we\'ve sent a code to ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280)),
                    ),
                    TextSpan(
                      text: '(****@mail.com)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '. Enter it here to verify your identity',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
                softWrap: true,
              ),
              const SizedBox(height: 32),
              Center(
                child: Pinput(
                  length: 5,
                  controller: TextEditingController(text: text),
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    setState(() {
                      text = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 36),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Resend code in ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF727272)),
                      ),
                      TextSpan(
                        text: '$_seconds Secs',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF727272)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Center(
                child: Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const IdentityScreen()),
                    );
                  },
                  text: 'Confirm',
                  navigatorDestination: const IdentityScreen(),
                  buttonWidth: 327,
                  color: text.length == 5
                      ? buttonActiveColor
                      : buttonInactiveColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.09,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.3,
                    height: MediaQuery.of(context).size.height * 1.0,
                    child: NumericKeyboard(
                      onKeyboardTap: _onKeyboardTap,
                      textColor: Colors.black,
                      rightButtonFn: () {
                        setState(() {
                          if (text.isNotEmpty) {
                            text = text.substring(0, text.length - 1);
                          }
                        });
                      },
                      rightIcon:
                          const Icon(Icons.backspace, color: Colors.black),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
