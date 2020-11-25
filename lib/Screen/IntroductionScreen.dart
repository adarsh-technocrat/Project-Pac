import 'dart:math';

import 'package:evento/Components/UniversalVariables.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Model/changeLanguageModel.dart';
import 'package:evento/Screen/HomePage.dart';
import 'package:evento/Screen/registrationScreen.dart';
import 'package:evento/appLocalization/appLocalization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen>
    with SingleTickerProviderStateMixin {
  FireBaseRepo fireBaseRepo = FireBaseRepo();
  bool isLoginPressed = false;
  final List<String> list = [
    "assets/images/img1.jpg",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
    "assets/images/img4.jpg",
  ];

  Random random;

  int selectedindex = 0;

  Image img() {
    int min = 0;
    int max = list.length;
    random = Random();
    int r = min + random.nextInt(max - min);
    var imagename = list[r];
    return Image.asset(imagename);
  }

  void performLogin() {
    print("tring to perform login");
    setState(() {
      isLoginPressed = true;
    });
    fireBaseRepo.signInWithGoogle().then((User user) {
      print("something");
      if (user != null) {
        authenticateUser(user);
      } else {
        print("There was an error");
      }
    });
  }

  void authenticateUser(User user) {
    fireBaseRepo.authenticateUser(user).then((isNewUser) {
      setState(() {
        isLoginPressed = false;
      });
      if (isNewUser) {
        fireBaseRepo.addDataToDb(user).then((value) {
          Navigator.pushReplacement(context,
              CupertinoPageRoute(builder: (context) {
            return HomePage();
          }));
        });
      } else {
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) {
          return HomePage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.whiteColor,
      appBar: buildCustomAppBar(context),
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
            child: Text(
                AppLocalizations.of(context)
                    .translate('IntroScreen', 'welcome'),
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
              AppLocalizations.of(context).translate('IntroScreen', 'Quots'),
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
                    onPressed: () {
                      performLogin();
                    },
                    child: Row(
                      children: [
                        isLoginPressed
                            ? SizedBox(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      Colors.red),
                                  strokeWidth: 1,
                                ),
                                height: 20.0,
                                width: 20.0,
                              )
                            : Icon(
                                FlutterIcons.google_faw,
                                color: UniversalVariables.whiteColor,
                              ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                            AppLocalizations.of(context)
                                .translate('IntroScreen', 'googleSign'),
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  RegistrationScreen()));
                    },
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
                        Text(
                            AppLocalizations.of(context)
                                .translate('IntroScreen', 'register'),
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
                    text: AppLocalizations.of(context)
                        .translate('IntroScreen', 'first_term_string'),
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.greycolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)
                        .translate('IntroScreen', 'second_term_string'),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Terms & Service");
                      },
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.tealcolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)
                        .translate("IntroScreen", 'third_term_string'),
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: UniversalVariables.greycolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: AppLocalizations.of(context)
                        .translate("IntroScreen", 'forth_term_string'),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("Privacy Policy");
                      },
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

  languageIndicator() {
    switch (AppLocalizations.of(context).translate('IntroScreen', 'lang')) {
      case 'en':
        return CircleAvatar(
          radius: 15,
          backgroundColor: changelanguagelist[0].color,
          child: Text(changelanguagelist[0].languageInitials,
              style: TextStyle(
                color: UniversalVariables.whiteColor,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              )),
        );
        break;
      case 'hi':
        return CircleAvatar(
          radius: 15,
          backgroundColor: changelanguagelist[1].color,
          child: Text(changelanguagelist[1].languageInitials,
              style: TextStyle(
                color: UniversalVariables.whiteColor,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              )),
        );
        break;
      case 'mh':
        return CircleAvatar(
          radius: 15,
          backgroundColor: changelanguagelist[2].color,
          child: Text(changelanguagelist[2].languageInitials,
              style: TextStyle(
                color: UniversalVariables.whiteColor,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              )),
        );
        break;
      case 'fr':
        return CircleAvatar(
          radius: 15,
          backgroundColor: changelanguagelist[3].color,
          child: Text(changelanguagelist[3].languageInitials,
              style: TextStyle(
                color: UniversalVariables.whiteColor,
                fontSize: 11,
                fontWeight: FontWeight.w900,
              )),
        );
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
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Project",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ))),
                  TextSpan(
                      text: "pac",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        color: UniversalVariables.greencolor,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      )))
                ]),
              ),
              Expanded(
                child: Container(),
              ),
              GestureDetector(
                onTap: () {},
                child: languageIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future _showBottomSheet(BuildContext context) {
  //   return showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //       topRight: Radius.circular(15),
  //       topLeft: Radius.circular(15),
  //     )),
  //     builder: (context) {
  //       return StatefulBuilder(
  //           builder: (context, StateSetter setlanguageState) {
  //         return Container(
  //           height: 340,
  //           child: Padding(
  //             padding: const EdgeInsets.only(
  //                 left: 20, right: 20, bottom: 5, top: 20),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("Change Language",
  //                     style: GoogleFonts.openSans(
  //                         textStyle: TextStyle(
  //                       color: UniversalVariables.blackColor,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w700,
  //                     ))),
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 Text(
  //                   "Which language do you prefer?",
  //                   style: GoogleFonts.openSans(
  //                     textStyle: TextStyle(
  //                       color: UniversalVariables.greycolor,
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Expanded(
  //                   child: ListView.builder(
  //                       itemCount: changelanguagelist.length,
  //                       itemBuilder: (context, int index) {
  //                         return GestureDetector(
  //                           onTap: () async {
  //                             setlanguageState(() {
  //                               selectedindex = index;
  //                             });
  //                             await Future.delayed(Duration(milliseconds: 500));
  //                             Navigator.pop(context);
  //                             setState(() {});
  //                           },
  //                           child: ListTile(
  //                             contentPadding: EdgeInsets.zero,
  //                             leading: CircleAvatar(
  //                               radius: 15,
  //                               backgroundColor:
  //                                   changelanguagelist[index].color,
  //                               child: Text(
  //                                   changelanguagelist[index].languageInitials,
  //                                   style: TextStyle(
  //                                     color: UniversalVariables.whiteColor,
  //                                     fontSize: 11,
  //                                     fontWeight: FontWeight.w900,
  //                                   )),
  //                             ),
  //                             title:
  //                                 Text(changelanguagelist[index].languageName,
  //                                     style: GoogleFonts.openSans(
  //                                         textStyle: TextStyle(
  //                                       color: UniversalVariables.blackColor,
  //                                       fontSize: 15,
  //                                       fontWeight: FontWeight.w700,
  //                                     ))),
  //                             trailing: CircleAvatar(
  //                                 radius: 12,
  //                                 backgroundColor: selectedindex == index
  //                                     ? UniversalVariables.greencolor
  //                                     : UniversalVariables.unselectedcolor,
  //                                 child: Center(
  //                                   child: Icon(
  //                                     Icons.check,
  //                                     color: UniversalVariables.whiteColor,
  //                                     size: 16,
  //                                   ),
  //                                 )),
  //                           ),
  //                         );
  //                       }),
  //                 )
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //     },
  //   );
  // }
}
