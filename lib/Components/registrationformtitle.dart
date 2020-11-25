import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Defaultformtitle extends StatelessWidget {
  final String title;

  const Defaultformtitle({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                color: UniversalVariables.blackColor,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ))),
          TextSpan(
            text: " *",
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: UniversalVariables.redcolor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
