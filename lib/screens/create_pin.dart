import 'package:apex_sc/screens/onboarding_scree.dart';
import 'package:apex_sc/screens/sign_in.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:pinput/pinput.dart';

class CreatePin extends StatefulWidget {
  const CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  String text = "";

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
          backgroundColor: Colors.white,
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
                'Set Your PIN Code',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We use state-of-the-art security measures to ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF6B7280)),
                    ),
                    TextSpan(
                      text: 'protect your information at all times',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
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
              const SizedBox(height: 20),
              Center(
                child: Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  text: 'Confirm',
                  navigatorDestination: const SignIn(),
                  buttonWidth: 327,
                  color: text.length == 5
                      ? buttonActiveColor
                      : buttonInactiveColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.5,
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
    ;
  }
}
