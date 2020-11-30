import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            _modalBottomSheetMenu(context);
            HapticFeedback.lightImpact();
          },
          child: Container(
            height: 50,
            width: 50,
            color: Colors.black,
          )),
    );
  }

  void _modalBottomSheetMenu(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [],
              ),
            ),
          );
        });
  }
}
