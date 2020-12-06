import 'package:evento/Screen/ProfileScreen/personaProfile.dart';
import 'package:evento/Screen/ProfileScreen/projectUserTechnologyModel.dart';
import 'package:flutter/material.dart';
import 'package:evento/Components/cachedImage.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Model/UserModel.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter/gestures.dart';
import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FireBaseRepo firebaseRepo = FireBaseRepo();
  UserModel userModel;

  // bool flag = true;

  // String firsthalf;
  // String secondhalf;
  // var _text =
  //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    firebaseRepo.getCurrentUser().then((currentuser) {
      setState(() {
        userModel = UserModel(
          uid: currentuser.uid,
          name: currentuser.displayName,
          profilePhoto: currentuser.photoURL,
          email: currentuser.email,
        );
      });
    });
    // Expanding the text read more and read less;
    // if (_text.length > 150) {
    //   firsthalf = _text.substring(0, 150);
    //   secondhalf = _text.substring(150, _text.length);
    // } else {
    //   firsthalf = _text;
    //   secondhalf = "";
    // }
    super.initState();
  }

  Future<Null> onRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.black,
      //   onPressed: () {},
      //   label: Text("Filter"),
      // ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Scrollbar(
          thickness: 5.0,
          radius: Radius.circular(15),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 10,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    "OPEN SOURCE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://cdn.dribbble.com/users/1615584/screenshots/14359951/media/0271af1f45f38e8d38490dc499068ad8.jpg",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 8, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Google",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                // _offsetPopup(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, bottom: 5),
                            child: Text(
                              "These project will need a brand Identity where they will get recognise.",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff878B9B),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: projectTechnologyUsedModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  child: Material(
                                    color: projectTechnologyUsedModel[index]
                                        .bgcolor,
                                    borderRadius: BorderRadius.circular(8),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      onTap: () {},
                                      child: Container(
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              projectTechnologyUsedModel[index]
                                                  .text,
                                              style: TextStyle(
                                                color:
                                                    projectTechnologyUsedModel[
                                                            index]
                                                        .textcolor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, top: 8, right: 5, left: 5),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      FlutterIcons.paperclip_mco,
                                    ),
                                    onPressed: () {}),
                                Text(
                                  "3",
                                  style: TextStyle(),
                                ),
                                IconButton(
                                  icon: Icon(
                                    FlutterIcons.comment_check_outline_mco,
                                  ),
                                  onPressed: () {},
                                ),
                                Expanded(child: Container()),
                                RaisedButton(
                                  color: Colors.blueAccent,
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     CupertinoPageRout(
                                    //         builder: (context) =>
                                    //             ProjectDetailpage()));
                                  },
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
              // return Padding(
              //   padding: const EdgeInsets.only(bottom: 5),
              //   child: Container(
              //     // height: height / 1.5,

              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black,
              //           // blurRadius: 0,
              //           offset: Offset(0, -1),
              //         ),
              //       ],
              //     ),

              //     child: Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Material(
              //           color: Colors.white,
              //           child: InkWell(
              //             onTap: () {},
              //             child: Container(
              //               height: height / 12,
              //               width: width,
              //               child: Row(
              //                 children: [
              //                   CachedImage(
              //                     userModel?.profilePhoto == null
              //                         ? UniversalVariables.noImageAvailable
              //                         : userModel.profilePhoto,
              //                   ),
              //                   Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         userModel?.name == null
              //                             ? "Loading.."
              //                             : userModel.name,
              //                         style: TextStyle(
              //                           fontSize: 15,
              //                           fontWeight: FontWeight.bold,
              //                         ),
              //                       ),
              //                       Row(
              //                         children: [
              //                           Text(
              //                             "1d .",
              //                             style: TextStyle(
              //                               fontSize: 12,
              //                               color: Colors.grey,
              //                             ),
              //                           ),
              //                           SizedBox(
              //                             width: 5,
              //                           ),
              //                           Icon(
              //                             FlutterIcons.earth_ant,
              //                             size: 10,
              //                             color: Colors.grey,
              //                           )
              //                         ],
              //                       )
              //                     ],
              //                   ),
              //                   Expanded(
              //                     child: Container(),
              //                   ),
              //                   IconButton(
              //                     icon: Icon(
              //                       Icons.arrow_drop_down,
              //                       size: 30,
              //                       color: Colors.grey,
              //                     ),
              //                     onPressed: () {},
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Material(
              //             color: Colors.white,
              //             child: InkWell(
              //               onTap: () {},
              //               child: RichText(
              //                 text: TextSpan(
              //                   children: [
              //                     secondhalf.isEmpty
              //                         ? TextSpan(
              //                             text: firsthalf,
              //                             style: TextStyle(
              //                               color:
              //                                   UniversalVariables.blackColor,
              //                               fontWeight: FontWeight.w400,
              //                             ),
              //                           )
              //                         : TextSpan(
              //                             text: flag
              //                                 ? (firsthalf + "....")
              //                                 : (firsthalf + secondhalf + ".."),
              //                             style: TextStyle(
              //                               color:
              //                                   UniversalVariables.blackColor,
              //                               fontWeight: FontWeight.w400,
              //                             ),
              //                           ),
              //                     TextSpan(
              //                       text: flag ? ("more") : " less",
              //                       recognizer: TapGestureRecognizer()
              //                         ..onTap = () {
              //                           setState(() {
              //                             flag = !flag;
              //                           });
              //                         },
              //                       style: TextStyle(
              //                         color: Colors.blue,
              //                         fontWeight: FontWeight.w400,
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           child: Image.asset(
              //             "assets/images/img1.jpg",
              //             fit: BoxFit.cover,
              //           ),
              //         ),
              //         Container(
              //           width: width,
              //           child: Row(
              //             children: [
              //               Expanded(
              //                 child: FlatButton(
              //                   child: Row(
              //                     children: [
              //                       Icon(
              //                         FlutterIcons.like_evi,
              //                         size: 30,
              //                       ),
              //                       Text(
              //                         "55",
              //                         style: TextStyle(
              //                           fontSize: 12,
              //                           color: Colors.grey,
              //                         ),
              //                       ),
              //                       Expanded(
              //                         child: Container(),
              //                       ),
              //                       IconButton(
              //                         icon: Icon(FlutterIcons.github_alt_faw),
              //                         onPressed: () {},
              //                       ),
              //                       IconButton(
              //                         icon: Icon(FlutterIcons.instagram_ant),
              //                         onPressed: () {},
              //                       ),
              //                     ],
              //                   ),
              //                   onPressed: () {},
              //                 ),
              //               ),
              //               Expanded(
              //                 child: FlatButton(
              //                   child: Row(
              //                     children: [
              //                       IconButton(
              //                         icon: Icon(FlutterIcons.linkedin_box_mco),
              //                         onPressed: () {},
              //                       ),
              //                       IconButton(
              //                         icon: Icon(FlutterIcons.facebook_box_mco),
              //                         onPressed: () {},
              //                       ),
              //                       Expanded(
              //                         child: Container(),
              //                       ),
              //                       Icon(
              //                         FlutterIcons.bookmark_border_mdi,
              //                         size: 25,
              //                       ),
              //                     ],
              //                   ),
              //                   onPressed: () {},
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
            },
          ),
        ),
      ),
    );
  }
}
