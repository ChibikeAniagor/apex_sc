import 'package:apex_sc/providers/auth_provider.dart';
import 'package:apex_sc/screens/get_started.dart';
import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/screens/password_recovery.dart';
import 'package:apex_sc/screens/sign_up.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController creAccEmailTextEditingController =
      TextEditingController();
  final TextEditingController creAccPaswdTextEditingController =
      TextEditingController();
  bool isTextFieldEmpty = true;
  bool passwordObscured = true;
  @override
  void initState() {
    super.initState();
    creAccEmailTextEditingController.addListener(() {
      setState(() {
        isTextFieldEmpty = creAccEmailTextEditingController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    creAccEmailTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 8),
          child: Container(
            alignment: const Alignment(0.5, 0),
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.black12),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black38,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10, right: 18),
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: ' Hi There! 👋 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ), // Default text style
                          children: <TextSpan>[
                            TextSpan(
                              text: ' \n welcome back, Sign in to your account',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ), // Styled text
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    width: 390,
                    height: 80,
                    child: TextField(
                      controller: creAccEmailTextEditingController,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        enabled: true,
                        isDense: true,
                        label: const Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: blueHighlightedTextColor,
                          ),
                          borderRadius: BorderRadius.circular(10.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    width: 390,
                    height: 80,
                    child: TextField(
                      controller: creAccPaswdTextEditingController,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      obscureText: passwordObscured,
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        enabled: true,
                        isDense: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordObscured = !passwordObscured;
                            });
                          },
                          icon: Icon(passwordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        label: const Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: blueHighlightedTextColor,
                          ),
                          borderRadius: BorderRadius.circular(10.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PasswordRecovery()),
                          );
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: blueHighlightedTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Button(
                        buttonWidth: 327,
                        text: 'Sign In',
                        onPressed: () {
                          context.read<AuthProvider>().signIn(
                              email:
                                  creAccEmailTextEditingController.text.trim(),
                              password:
                                  creAccPaswdTextEditingController.text.trim());
                        },
                        navigatorDestination: const GetStarted(),
                        color: isTextFieldEmpty
                            ? buttonInactiveColor
                            : buttonActiveColor),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/google_icon.jpg",
                            height: 15,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/icons/apple_icon.jpg",
                            height: 30,
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      color: blueHighlightedTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
