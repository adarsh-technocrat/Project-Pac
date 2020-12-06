import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/services.dart.';

class ProjectDetailpage extends StatefulWidget {
  @override
  _ProjectDetailpageState createState() => _ProjectDetailpageState();
}

class _ProjectDetailpageState extends State<ProjectDetailpage> {
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Google"),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff565AB1),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            splashColor: Colors.white10,
            onTap: () {
              _uploadPerposalSheet();
              HapticFeedback.lightImpact();
            },
            child: Container(
              height: 50,
              child: Center(
                child: Text(
                  "Send Project Perposal",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://cdn.dribbble.com/users/1615584/screenshots/14359951/media/0271af1f45f38e8d38490dc499068ad8.jpg",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          child: Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 50,
                          )),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  // Positioned(
                  //     left: 5,
                  //     child: Material(
                  //       borderRadius: BorderRadius.circular(30),
                  //       color: Colors.white,
                  //       child: InkWell(
                  //         onTap: () {},
                  //         borderRadius: BorderRadius.circular(30),
                  //         child: Icon(
                  //           Icons.cancel,
                  //           size: 40,
                  //         ),
                  //       ),
                  //     )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _uploadPerposalSheet() {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        print("add Document file ");
                      },
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        color: Colors.grey,
                        dashPattern: [10, 5],
                        radius: Radius.circular(15),
                        child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Icon(
                                FlutterIcons.file_upload_faw5s,
                                size: 30,
                                color: Colors.grey,
                              ),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10),
                          child: RaisedButton(
                            elevation: 0,
                            color: Color(0xff7DD189),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () async {
                              setModalState(() {
                                _isUploading = true;
                              });
                              await Future.delayed(Duration(seconds: 4));
                              setModalState(() {
                                _isUploading = false;
                              });
                              Navigator.pop(context);
                              HapticFeedback.heavyImpact();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _isUploading
                                    ? SizedBox(
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Colors.greenAccent),
                                          strokeWidth: 1,
                                        ),
                                        height: 20.0,
                                        width: 20.0,
                                      )
                                    : Icon(
                                        FlutterIcons.upload_ant,
                                        color: UniversalVariables.whiteColor,
                                      ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Upload",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      color: UniversalVariables.whiteColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ))),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 0, left: 10, right: 10),
                          child: RaisedButton(
                            elevation: 0,
                            color: Color(0xff323232),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.cancel,
                                  color: UniversalVariables.whiteColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(" Cancle",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                      color: UniversalVariables.whiteColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
