import 'dart:math';

import 'package:evento/Components/CustomAppBar.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatelessWidget {
  final List<String> list = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg"
  ];
  Random random;

  Image img() {
    int min = 0;
    int max = list.length;
    random = Random();
    int r = min + random.nextInt(max - min);
    var imagename = list[r];
    return Image.asset(imagename);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.whiteColor,
      appBar: CustomAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Container()),
          Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: img(),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text("Welcome to Evento!",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: UniversalVariables.blackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(
              "Are you ready to enjoy a whole new life without\nlimits? Let's go!",
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  color: UniversalVariables.greycolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: RaisedButton(
                    elevation: 0,
                    color: UniversalVariables.pinkcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(
                          FlutterIcons.google_faw,
                          color: UniversalVariables.whiteColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Google Sign In",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                              color: UniversalVariables.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: RaisedButton(
                    elevation: 0,
                    color: UniversalVariables.lightyellowcolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FlutterIcons.sign_in_faw,
                          color: UniversalVariables.blackColor,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Register",
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                              color: UniversalVariables.blackColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By logging in or registering, you agree to our",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.greycolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " Terms of Service ",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.tealcolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " and ",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.greycolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " Privacy Policy",
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.tealcolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
