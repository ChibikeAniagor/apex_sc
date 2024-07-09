import 'package:apex_sc/screens/otp_screen.dart';
import 'package:apex_sc/screens/sign_in.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:flutter/material.dart';

class ResetPasswrd extends StatefulWidget {
  const ResetPasswrd({super.key});

  @override
  State<ResetPasswrd> createState() => _ResetPasswrdState();
}

class _ResetPasswrdState extends State<ResetPasswrd> {
  // password controller
  final TextEditingController resetPaswrdTextEditingController0 =
      TextEditingController();
  // confirm password controller
  final TextEditingController resetPaswrdTextEditingController1 =
      TextEditingController();

  bool isTextFieldEmpty = true;
  // resetPaswrdTextEditingController0
  bool passwordObscured0 = true;
  // resetPaswrdTextEditingController1
  bool passwordObscured1 = true;

  void initState() {
    super.initState();
    resetPaswrdTextEditingController0.addListener(_updateButtonState);
    resetPaswrdTextEditingController1.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isTextFieldEmpty = resetPaswrdTextEditingController0.text.isEmpty ||
          resetPaswrdTextEditingController1.text.isEmpty;
    });
  }

  @override
  void dispose() {
    resetPaswrdTextEditingController0.dispose();
    resetPaswrdTextEditingController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/backarrow_icon.png'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0, top: 25, left: 10),
                      child: Text(
                        'Create New Password',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 0, top: 0),
                      child: Text(
                          ' \n Please, enter a new password below different \n from the previous password',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.transparent,
                    width: 390,
                    height: 80,
                    child: TextField(
                      controller: resetPaswrdTextEditingController0,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      obscureText: passwordObscured0,
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
                              passwordObscured0 = !passwordObscured0;
                            });
                          },
                          icon: Icon(passwordObscured0
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
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
                      controller: resetPaswrdTextEditingController1,
                      enabled: true,
                      textCapitalization: TextCapitalization.words,
                      obscureText: passwordObscured1,
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
                              passwordObscured1 = !passwordObscured1;
                            });
                          },
                          icon: Icon(passwordObscured0
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
                        ),
                        label: const Text(
                          "Confirm Password",
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.5),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Center(
                  child: Button(
                      buttonWidth: 327,
                      text: 'Create New Password',
                      navigatorDestination: const SignIn(),
                      color: isTextFieldEmpty
                          ? buttonInactiveColor
                          : buttonActiveColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
