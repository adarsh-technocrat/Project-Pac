import 'package:evento/Components/UniversalVariables.dart';
import 'package:evento/Components/cachedImage.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Model/UserModel.dart';
import 'package:evento/Screen/IntroductionScreen.dart';
import 'package:evento/Screen/ProfileScreen/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    Key key,
  }) : super(key: key);

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  FireBaseRepo _fireBaseRepo = FireBaseRepo();
  UserModel userModel;
  @override
  void initState() {
    _fireBaseRepo.getCurrentUser().then((currentuser) {
      setState(() {
        userModel = UserModel(
          uid: currentuser.uid,
          name: currentuser.displayName,
          profilePhoto: currentuser.photoURL,
          email: currentuser.email,
        );
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: Colors.white,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 1,
                              color: UniversalVariables.separatorColor))),
                  child: Material(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        child: Row(
                          children: [
                            CachedImage(
                              userModel?.profilePhoto != null
                                  ? userModel.profilePhoto
                                  : UniversalVariables.noImageAvailable,
                              radius: 50,
                              isRound: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    userModel?.name != null
                                        ? userModel.name
                                        : "Loading...",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      child: Text(
                                        "View Profile",
                                        style: TextStyle(
                                          color: Color(0xff2A659B),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    ProfileScreen()));
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: UniversalVariables.greycolor,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      child: Text(
                                        "Settings",
                                        style: TextStyle(
                                          color: Color(0xff2A659B),
                                          fontSize: 15,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Expanded(
                                child: IconButton(
                              icon: Icon(
                                Icons.cancel,
                                color: UniversalVariables.greycolor,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: Material(
                        child: InkWell(
                            onTap: () {
                              _fireBaseRepo.signOutGoogle().then((value) {
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (BuildContext context) =>
                                            IntroductionScreen()));
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.logout_ant,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "TODO",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.add_circle_outline_mdi,
                                    size: 20,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Find Open Source Projects Near you",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.find_ant,
                                    size: 20,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Project Development Ideas",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.bulb1_ant,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Project Bookmark",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.bookmark_border_mdi,
                                    size: 20,
                                    color: Colors.blue[400],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Container(
                      child: Material(
                        color: Colors.white,
                        child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Help",
                                    style: TextStyle(
                                        color: UniversalVariables.blackColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    FlutterIcons.help_box_mco,
                                    size: 20,
                                    color: Colors.red[400],
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Material(
              color: Colors.white,
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/jobhering.png",
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
