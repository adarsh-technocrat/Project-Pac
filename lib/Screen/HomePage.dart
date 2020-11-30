import 'package:dotted_border/dotted_border.dart';
import 'package:evento/Components/customappBar.dart';
import 'package:evento/Database/FirebaseRepo.dart';
import 'package:evento/Screen/ProfileScreen/ProfileScreen.dart';
import 'package:evento/Screen/ProjectScreen/projectScreen.dart';
import 'package:evento/Screen/SettingScreen/settingScreen.dart';
import 'package:evento/Screen/homeScreen/homeScreen.dart';
import 'package:evento/Screen/postScreen/postScreen.dart';
import 'package:evento/Widgets/notificationSection.dart';
import 'package:evento/Widgets/sideDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';

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
  // double _slidervalue = 0.0;
  // bool hidebottomsection;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    // _selectedItem = _dropdownMenuItems[0].value;

    _fireBaseRepo.getCurrentUser().then((user) {
      setState(() {
        _currentuserId = user.uid;
        _userDp = user.photoURL;
      });
    });
    super.initState();
  }

  // List<ListItem> _dropdownItems = [
  //   ListItem(1, "All Projects"),
  //   ListItem(2, "Open-Source Projects"),
  //   ListItem(3, "Fresh Projects"),
  //   ListItem(4, "Ongoing Projects")
  // ];
  // List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  // ListItem _selectedItem;
  // List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
  //   List<DropdownMenuItem<ListItem>> items = List();
  //   for (ListItem listItem in listItems) {
  //     items.add(
  //       DropdownMenuItem(
  //         child: Text(listItem.name),
  //         value: listItem,
  //       ),
  //     );
  //   }
  //   return items;
  // }

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ProjectScreen(),
    PostScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideDrawer(),
      appBar: CustomAppBar(
        drawerTap: () {
          _scaffoldKey.currentState.openDrawer();
        },
        searchtap: () {},
        notification: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => NotificationSection(),
            ),
          );
        },
        // here is the slider section
        // slideractiveColor: Color(0xff6282C3),
        // sliderdevision: 10,
        // slidermax: 5.0,
        // slidermin: 0.0,
        // slidervalue: _slidervalue,
        // sliderlable: "10km",
        // slideronChanged: (newvalue) {
        //   setState(() {
        //     _slidervalue = newvalue;
        //     HapticFeedback.heavyImpact();
        //   });
        // },
        // hiding bottom section
        // hidebottomsection: true,
        // here is the menue item  section
        // dropdownMenuItems: _dropdownMenuItems,
        // dropdownselectedItem: _selectedItem,
        // dropdownOnchange: (value) {
        //   setState(() {
        //     _selectedItem = value;
        //   });
        // },
      ),
      body: _widgetOptions.elementAt(_currentindex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentindex,
        selectedItemColor: Color(0xff2A659B),
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.home_ant,
              ),
              label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(
              FlutterIcons.folder1_ant,
            ),
            label: "Projects",
          ),
          BottomNavigationBarItem(
            // icon: Icon(
            //   FlutterIcons.add_box_mdi,
            //   size: 30,
            // ),
            label: "",

            icon: DottedBorder(
              borderType: BorderType.Circle,
              child: Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.setting_ant,
              ),
              label: "Settings"),
          BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.profile_ant,
              ),
              label: "Profile"),
        ],
      ),
    );
  }

  onTapped(int index) {
    setState(() {
      _currentindex = index;
      HapticFeedback.lightImpact();
    });
  }
}
