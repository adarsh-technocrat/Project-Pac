import 'package:evento/Components/UniversalVariables.dart';
import 'package:evento/Components/registrationformtitle.dart';
import 'package:evento/Screen/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UniversalVariables.whiteColor,
      appBar: buildCustomAppBar(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UniversalVariables.lightgreycolor,
        child: Icon(
          Icons.arrow_forward,
          color: UniversalVariables.whiteColor,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (BuildContext context) => HomePage()));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("You're almost there !",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: UniversalVariables.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ))),
            SizedBox(
              height: 10,
            ),
            Text(
                "You only have to enter an OTP code we sent via SMS to your registered phone number +918459645772",
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                  color: UniversalVariables.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ))),
            SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Defaultformtitle(
                    title: "OTP",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: ". . . .",
                        hintStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                          color: UniversalVariables.blackColor,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize buildCustomAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 10),
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          color: UniversalVariables.whiteColor,
        ),
        child: SafeArea(
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: UniversalVariables.greycolor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Expanded(
                child: Container(),
              ),
              IconButton(
                  icon: Icon(
                    Icons.info,
                    size: 25,
                    color: UniversalVariables.greycolor,
                  ),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
