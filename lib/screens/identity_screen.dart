import 'package:apex_sc/screens/create_pin.dart';
import 'package:apex_sc/screens/sign_in.dart';
import 'package:apex_sc/utils/color_utils.dart';
import 'package:apex_sc/widgets/button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:ephone_field/ephone_field.dart';
import 'package:flutter/material.dart';

class IdentityScreen extends StatefulWidget {
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  //identity password controller
  final TextEditingController idPassWrdController = TextEditingController();
  // identity full name controller
  final TextEditingController fullNameController = TextEditingController();
  // identity username controller
  final TextEditingController userNameController = TextEditingController();

  bool isTextFieldEmpty = true;
  bool passwordObscured = true;
  @override
  void initState() {
    super.initState();
    idPassWrdController.addListener(() {
      setState(() {
        isTextFieldEmpty = idPassWrdController.text.isEmpty ||
            fullNameController.text.isEmpty ||
            userNameController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    idPassWrdController.dispose();
    fullNameController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 0),
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
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 18),
                    child: Row(
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: ' Hey There! Tell us abit \n about ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ), // Default text style
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Yourself',
                                style: TextStyle(
                                  color: blueHighlightedTextColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24,
                                ), // Styled text
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.transparent,
                      width: 390,
                      height: 80,
                      child: TextField(
                        controller: fullNameController,
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
                            "Full name",
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
                        controller: userNameController,
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
                            "User name",
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

                  const CSCPicker(
                    showCities: false,
                    showStates: false,
                  ),

                  // const EPhoneField(
                  //     pickerHeight: CountryPickerHeigth.h75,
                  //     menuType: PickerMenuType.bottomSheet,
                  //     phoneLabelText: '',
                  //     initialType: EphoneFieldType.phone,
                  //     // initialCountry: Country.nigeria,
                  //     isSearchable: true,
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(),
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //         borderSide: BorderSide(
                  //           color: blueHighlightedTextColor,
                  //           width: 1,
                  //         ),
                  //         borderRadius: BorderRadius.all(Radius.circular(15)),
                  //       ),
                  //     )),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.transparent,
                      width: 390,
                      height: 80,
                      child: TextField(
                        controller: idPassWrdController,
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
                    height: 10,
                  ),
                  Button(
                      text: 'Continue',
                      navigatorDestination: const CreatePin(),
                      color: isTextFieldEmpty
                          ? buttonInactiveColor
                          : buttonActiveColor),
                ],
              ),
            ])));
  }
}
