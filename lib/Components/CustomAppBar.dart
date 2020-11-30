import 'package:evento/Widgets/projectFilterSection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../Components/UniversalVariables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function searchtap;
  final Function drawerTap;
  final Function notification;
  // final double slidervalue;
  // final double slidermin;
  // final double slidermax;
  // final Function(double) slideronChanged;
  // final Color slideractiveColor;
  // final int sliderdevision;
  // final String sliderlable;
  // final Function filtericonOnpress;
  // final List<DropdownMenuItem<ListItem>> dropdownMenuItems;
  // final ListItem dropdownselectedItem;
  // final Function dropdownOnchange;
  // final bool hidebottomsection;
  CustomAppBar({
    Key key,
    this.searchtap,
    this.drawerTap,
    this.notification,
    // this.slidervalue,
    // this.slidermin,
    // this.slidermax,
    // this.slideronChanged,
    // this.slideractiveColor,
    // this.sliderdevision,
    // this.sliderlable,
    // this.filtericonOnpress,
    // @required this.dropdownMenuItems,
    // @required this.dropdownselectedItem,
    // @required this.dropdownOnchange,
    // this.hidebottomsection = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/menu.png",
          ),
          onPressed: drawerTap,
        ),
        title: GestureDetector(
          onTap: searchtap,
          child: Container(
            height: 40,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: UniversalVariables.searchbarcolor,
                borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Icon(FlutterIcons.search1_ant, size: 20),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: UniversalVariables.blackColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(FlutterIcons.tune_mco),
            onPressed: () {
              Navigator.push(
                  context, CupertinoPageRoute(builder: (_) => ProjectFilter()));
            },
          ),
          IconButton(
            icon: Icon(FlutterIcons.notification_ant),
            onPressed: notification,
          ),
        ],
        // bottom: PreferredSize(
        //   preferredSize: preferredSize,
        //   child: AnimatedOpacity(
        //     opacity: !hidebottomsection ? 1 : 0,
        //     curve: Curves.easeOutSine,
        //     duration: Duration(milliseconds: 500),
        //     child: !hidebottomsection
        //         ? Material(
        //             color: Colors.transparent,
        //             child: Column(
        //               children: [
        //                 Container(
        //                   height: 35,
        //                   color: Colors.transparent,
        //                   width: MediaQuery.of(context).size.width,
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.end,
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     children: [
        //                       Padding(
        //                         padding: const EdgeInsets.only(right: 10),
        //                         child: Material(
        //                           child: InkWell(
        //                             borderRadius: BorderRadius.circular(10.0),
        //                             onTap: () {},
        //                             child: Container(
        //                               padding: const EdgeInsets.only(
        //                                   left: 10.0, right: 10.0),
        //                               decoration: BoxDecoration(
        //                                   borderRadius:
        //                                       BorderRadius.circular(10.0),
        //                                   color: Colors.transparent,
        //                                   border: Border.all()),
        //                               child: DropdownButtonHideUnderline(
        //                                 child: DropdownButton<ListItem>(
        //                                     value: dropdownselectedItem,
        //                                     items: dropdownMenuItems,
        //                                     onChanged: dropdownOnchange),
        //                               ),
        //                             ),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 Container(
        //                   height: 20,
        //                   width: MediaQuery.of(context).size.width,
        //                   child: SliderTheme(
        //                     data: SliderTheme.of(context).copyWith(
        //                       valueIndicatorColor: Colors
        //                           .white, // This is what you are asking for

        //                       thumbShape: RoundSliderThumbShape(
        //                           enabledThumbRadius: 12.0),
        //                       overlayShape:
        //                           RoundSliderOverlayShape(overlayRadius: 35.0),
        //                     ),
        //                     child: Slider(
        //                       inactiveColor: Color(0xffA0BBEE),
        //                       min: slidermin,
        //                       max: slidermax,
        //                       value: slidervalue,
        //                       onChanged: slideronChanged,
        //                       activeColor: slideractiveColor,
        //                       divisions: sliderdevision,
        //                       label: sliderlable,
        //                       onChangeStart: slideronChanged,
        //                       onChangeEnd: slideronChanged,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )
        //         : Container(),
        //   ),
        // ),
      ),
    );
  }

  final Size preferredSize = Size.fromHeight(kToolbarHeight);
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
