import 'package:flutter/material.dart';

class ProjectTechnologyUsedModel {
  final String text;
  final Color bgcolor;
  final Color textcolor;

  ProjectTechnologyUsedModel({this.text, this.bgcolor, this.textcolor});
}

List<ProjectTechnologyUsedModel> projectTechnologyUsedModel = [
  ProjectTechnologyUsedModel(
    text: "ANDROID",
    bgcolor: Color(0xffEBF8F2),
    textcolor: Color(0xff35B881),
  ),
  ProjectTechnologyUsedModel(
    text: "IOS APP",
    bgcolor: Color(0xffFFF2EC),
    textcolor: Color(0xffFD8243),
  ),
  ProjectTechnologyUsedModel(
    text: "BRANDING",
    bgcolor: Color(0xffEEEFF7),
    textcolor: Color(0xff5B64B0),
  ),
  ProjectTechnologyUsedModel(
    text: "WEBSITE",
    bgcolor: Color(0xffE6F7FB),
    textcolor: Color(0xff04ADD8),
  ),
  ProjectTechnologyUsedModel(
    text: "IOT",
    bgcolor: Color(0xffF6F2FC),
    textcolor: Color(0xffA17EDA),
  ),
  ProjectTechnologyUsedModel(
    text: "AR",
    bgcolor: Color(0xffE6F2FF),
    textcolor: Color(0xff1D89FF),
  ),
];
