import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
const Color bluishclr = Color(0xFF4e5ae8);
const Color yellowclr = Color(0xFFFFB746);
const Color pinkclr = Color(0xFFff4667);
const Color white = Colors.white;
const Color prcolor = bluishclr;
const Color darkGreyColor = Color(0xFF121212);
const Color darkHeaderclr = Color(0xFF424242);

class Themes {
 static final light = ThemeData(
   backgroundColor: Colors.white,
   colorScheme: ColorScheme.light().copyWith(primary: Color(0xFF4e5ae8)),
   brightness: Brightness.light
 );
 static final dark = ThemeData(
   backgroundColor: Color(0xFF121212),
   brightness: Brightness.dark
 );

 TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
   textStyle: TextStyle(
       fontSize: 24,
       fontWeight: FontWeight.bold,
       color: Get.isDarkMode? Colors.grey[400]:Colors.grey
   )
  );
 }
 TextStyle get HeadingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode? Colors.white:Colors.black
      )
  );
 }
 TextStyle get TitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode? Colors.white:Colors.black
      )
  );
 }
 TextStyle get SubTitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Get.isDarkMode? Colors.grey[100]:Colors.grey[600]
      )
  );
 }
}