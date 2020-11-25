import 'package:evento/Components/customappBar.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Screen/ProjectScreen/projectScreen.dart';
import 'package:evento/Screen/SettingScreen/settingScreen.dart';
import 'package:evento/Screen/homeScreen/homeScreen.dart';
import 'package:evento/Screen/postScreen/postScreen.dart';
import 'package:evento/Widgets/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FireBaseRepo _fireBaseRepo = FireBaseRepo();
  String _currentuserId;
  String _userDp;
  int _currentindex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _fireBaseRepo.getCurrentUser().then((user) {
      setState(() {
        _currentuserId = user.uid;
        _userDp = user.photoURL;
      });
    });
    super.initState();
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    PostScreen(),
    ProjectScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: _currentindex == 2
          ? null
          : CustomAppBar(
              img: _userDp != null
                  ? "$_userDp"
                  : UniversalVariables.noImageAvailable,
              drawerTap: () {
                _scaffoldKey.currentState.openDrawer();
              },
              searchtap: () {},
              messageTap: () {},
            ),
      body: _widgetOptions.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentindex,
        selectedItemColor: Color(0xff2A659B),
        unselectedItemColor: Color(0xff656565),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.home_ant,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.add_box_mdi,
                size: 30,
              ),
              label: "Post"),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.folder1_ant,
              ),
              label: "Projects"),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.setting_ant,
              ),
              label: "settings"),
        ],
      ),
    );
  }

  onTapped(int index) {
    setState(() {
      _currentindex = index;
    });
  }
}
