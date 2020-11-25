import 'package:evento/Components/cachedImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../Components/UniversalVariables.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String img;
  final Function searchtap;
  final Function drawerTap;
  final Function messageTap;

  const CustomAppBar(
      {Key key, this.img, this.searchtap, this.drawerTap, this.messageTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        elevation: 2,
        leading: GestureDetector(
          onTap: drawerTap,
          child: CachedImage(
            img,
            radius: 25,
            isRound: true,
          ),
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
            icon: Icon(FlutterIcons.notification_ant),
            onPressed: messageTap,
          )
        ],
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}