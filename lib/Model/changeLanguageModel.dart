import 'package:evento/Components/UniversalVariables.dart';
import 'package:flutter/material.dart';

class ChangeLanguageModel {
  final String languageInitials;

  final Color color;

  ChangeLanguageModel({this.languageInitials, this.color});
}

List<ChangeLanguageModel> changelanguagelist = [
  ChangeLanguageModel(
    color: UniversalVariables.localizationlistcolor[0],
    languageInitials: "EN",
  ),
  ChangeLanguageModel(
    color: UniversalVariables.localizationlistcolor[1],
    languageInitials: "हिं",
  ),
  ChangeLanguageModel(
    color: UniversalVariables.localizationlistcolor[2],
    languageInitials: "MA",
  ),
  ChangeLanguageModel(
    color: UniversalVariables.localizationlistcolor[3],
    languageInitials: "FR",
  ),
];
