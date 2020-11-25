import 'package:evento/Components/UniversalVariables.dart';
import 'package:evento/Components/registrationformtitle.dart';
import 'package:evento/Screen/otpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _validate = false;
  bool _isloading = false;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  String phoneNumber;
  String phoneIsoCode;
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return (!regExp.hasMatch(em)) ? false : true;
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      print(phoneNumber);
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: UniversalVariables.whiteColor,
      appBar: buildCustomAppBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _validate
            ? UniversalVariables.greencolor
            : UniversalVariables.lightgreycolor,
        child: _isloading
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: CircularProgressIndicator(
                  backgroundColor: UniversalVariables.whiteColor,
                  strokeWidth: 3,
                ),
              )
            : Icon(
                Icons.arrow_forward,
                color: UniversalVariables.whiteColor,
                size: 30,
              ),
        onPressed: () {
          onSubmit();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Register",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: UniversalVariables.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ))),
            SizedBox(
              height: 10,
            ),
            Text("Please fill in a few details below",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: UniversalVariables.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ))),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              onChanged: () {
                setState(() {
                  _formKey.currentState.validate()
                      ? _validate = true
                      : _validate = false;
                });
              },
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Defaultformtitle(
                    title: "Full Name",
                  ),
                  TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "e.g Name",
                      hintStyle: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: UniversalVariables.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Defaultformtitle(
                    title: "Email",
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        hintText: "e.g name@email.com",
                        hintStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          color: UniversalVariables.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ))),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (input) =>
                        isEmail(input) ? null : "Enter Valid Email ID",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Defaultformtitle(
                    title: "Phone Number",
                  ),
                  InternationalPhoneInput(
                    onPhoneNumberChange: onPhoneNumberChange,
                    initialPhoneNumber: phoneNumber,
                    initialSelection: "+91",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  onSubmit() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _validate = true;
      });
      print(onPhoneNumberChange);
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        _isloading = true;
      });
      await Future.delayed(Duration(milliseconds: 300));

      Navigator.push(context,
          CupertinoPageRoute(builder: (BuildContext context) => OtpScreen()));
      setState(() {
        _isloading = false;
      });
    }
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 10),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: UniversalVariables.whiteColor,
        ),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: UniversalVariables.greycolor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Expanded(
                child: Container(),
              ),
              IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 25,
                    color: UniversalVariables.greycolor,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
