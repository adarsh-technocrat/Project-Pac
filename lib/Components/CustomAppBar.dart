import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    text: "Event",
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ))),
                TextSpan(
                    text: "o",
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
              child: CircleAvatar(
                radius: 15,
                backgroundColor: UniversalVariables.localizationlistcolor[0],
                child: Text("EN",
                    style: TextStyle(
                      color: UniversalVariables.whiteColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
