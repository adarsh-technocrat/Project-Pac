import 'package:flutter/material.dart';
import 'package:evento/Components/zanimatedToogle.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:evento/Screen/IntroductionScreen.dart';
import 'package:provider/provider.dart';
import 'package:evento/DynamicThemeing/models_provider/themeprovider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _enable = false;
  bool _isdeleataccount = false;
  FireBaseRepo firebaseRepo = FireBaseRepo();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // Now we have access to the theme properties
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Theme Switcher",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ZAnimatedToggle(
                onToggleCallback: (value) async {
                  await themeprovider.toggleThemeData();
                },
                values: ["Light", "Dark"],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Material(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    setState(() {
                      _enable = true;
                    });
                    await Future.delayed(Duration(seconds: 5));
                  },
                  child: Shimmer.fromColors(
                    baseColor: UniversalVariables.blackColor,
                    highlightColor: Colors.blue,
                    enabled: _enable,
                    child: Container(
                      height: 80,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FlutterIcons.location_ent,
                            size: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Location",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Saved",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Material(
                color: Color(0xffF6F6F6),
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    setState(() {
                      _isdeleataccount = true;
                    });
                    await Future.delayed(Duration(seconds: 5));
                    firebaseRepo.deleteUserAccount().then((value) {
                      print("Account Deleted!!");
                      firebaseRepo.signOutGoogle().then((value) {
                        print("Account Signedout!!");
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => IntroductionScreen()));
                      });
                    });
                  },
                  child: Shimmer.fromColors(
                    baseColor: UniversalVariables.blackColor,
                    highlightColor: Colors.red,
                    enabled: _isdeleataccount,
                    child: Container(
                      height: 80,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FlutterIcons.delete_ant,
                            size: 30,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Permanently",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Color(0xffD8D8D8),
              height: 0,
              thickness: 2.0,
            ),
            Material(
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: UniversalVariables.separatorColor))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  firebaseRepo.signOutGoogle().then((value) {
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                IntroductionScreen()));
                  });
                },
                child: Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: UniversalVariables.separatorColor))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Sign Out",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: width,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Project",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ))),
                          TextSpan(
                              text: "Pac",
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                color: UniversalVariables.greencolor,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              )))
                        ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
