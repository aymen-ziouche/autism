

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xpert_autism/common/my_colors.dart';

class AppTheme {
  static TextStyle titleTextStyle = GoogleFonts.leagueSpartan(
    color: Colors.white,
    fontSize: 46,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle bodyTextSmall = GoogleFonts.leagueSpartan(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle bodyTextSmall2 = GoogleFonts.leagueSpartan(
    color: Colors.blueAccent,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle buttonText = GoogleFonts.leagueSpartan(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle buttonTextBlue = GoogleFonts.leagueSpartan(
    color: MyColors.mainColor,
    fontSize: 21,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
}
