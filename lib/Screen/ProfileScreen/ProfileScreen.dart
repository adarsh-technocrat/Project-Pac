import 'package:dotted_border/dotted_border.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:evento/Components/cachedImage.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Model/UserModel.dart';
import 'package:evento/Screen/ProfileScreen/personaProfile.dart';
import 'package:evento/Screen/ProfileScreen/projectUserTechnologyModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  FireBaseRepo fireBaseRepo = FireBaseRepo();
  TabController _tabController;
  int _currentindex = 0;
  UserModel userModel;

  @override
  void initState() {
    _tabController = new TabController(initialIndex: 0, length: 2, vsync: this);
    _tabController.addListener(_listenindex);
    fireBaseRepo.getCurrentUser().then((user) {
      setState(() {
        userModel = UserModel(
          name: user.displayName,
          profilePhoto: user.photoURL,
          email: user.email,
        );
      });
    });
    super.initState();
  }

  _listenindex() {
    setState(() {
      _currentindex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          // this one stays at the back

          child: Column(
            children: [
              Row(
                children: [
                  CachedImage(
                    userModel?.profilePhoto != null
                        ? userModel.profilePhoto
                        : UniversalVariables.noImageAvailable,
                    isRound: true,
                    radius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            userModel?.name != null
                                ? userModel.name
                                : "Loading...",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: Text(
                            userModel?.email != null
                                ? userModel.email
                                : "Loading...",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_work_rounded,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Working from home",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Text(
                  "Technology is a passion of mine and I enjoy nothing more than learning the trends that technology is taking in order to work more efficiently and see progress",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: Color(0xffFAFBFC),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      "Edit profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff122027),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              "Most Used Language",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 1,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 5,
                                            left: 20,
                                            right: 10,
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Dart",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child:
                                                          new LinearPercentIndicator(
                                                        lineHeight: 8.0,
                                                        animation: true,
                                                        animationDuration: 2500,
                                                        percent: 0.73,
                                                        backgroundColor:
                                                            Colors.white,
                                                        progressColor:
                                                            Color(0xff48B5AB),
                                                      ),
                                                    ),
                                                    Text(
                                                      "73.12%",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
                  child: innerNestedTabs(),
                ),
              ),
              tabbody(),
              // Container(
              //   color: Colors.white,
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 1.55,
              //   child: TabBarView(
              //     controller: _tabController,
              //     children: [
              //       OverView(context: context),
              //       Container(
              //         height: 200.0,
              //         child: Center(child: Text('Projets')),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  tabbody() {
    if (_currentindex == 0) {
      return OverViewTab(context: context);
    } else {
      return ProjectTab();
    }
  }

  innerNestedTabs() {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.all(10.0),
          indicatorColor: Color(0xff122027),
          indicatorWeight: 5.0,
          tabs: [
            Text(
              "OverView",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Projects",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectTab extends StatelessWidget {
  const ProjectTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) => Padding(
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "https://cdn.dribbble.com/users/2254924/screenshots/7448514/media/c6f301a7806f9cb072f34b35a0f6bdcd.png",
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                            ),
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
                                _offsetPopup(),
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
                          Row(
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
                              Personaprofile(
                                images: [
                                  "https://images.unsplash.com/photo-1458071103673-6a6e4c4a3413?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                                  "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=400&q=80",
                                  "https://images.unsplash.com/photo-1470406852800-b97e5d92e2aa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
                                ],
                                totalCount: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _offsetPopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text(
              "View",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Text(
              "Share",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          PopupMenuItem(
            value: 3,
            child: Text(
              "Project Chat Box",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
        onSelected: (value) {
          print("value:$value");
        },
        icon: Icon(
          Icons.more_horiz_rounded,
          size: 30,
        ),
        offset: Offset(0, 100),
      );
}

class OverViewTab extends StatelessWidget {
  const OverViewTab({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.grey,
            dashPattern: [10, 5],
            radius: Radius.circular(15),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Showcase your work",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: "by featuring your best documents",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add featured",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            "Contact",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Icons.edit_outlined),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Flexible(
                      child: Scrollbar(
                        thickness: 5.0,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 20,
                              right: 10,
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    FlutterIcons.linkedin_box_mco,
                                    size: 30,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: UniversalVariables
                                                    .separatorColor),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Linkedin Profile",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Material(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: Text(
                                                    "https://www.linkedin.com/in/adarsh-kumar-singh-673b1817b/",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
