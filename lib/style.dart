import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff1C1C1E);
  static const Color green = Color(0xff59FC9C);
  static const Color darkGreen = Color(0xff3CC498);
  static const Color greyGreen = Color(0xff7E95C2);
  static const Color blackGreen = Color(0xff459270);
  static const Color blueGreen = Color(0xff3CC4B4);
  static const Color blue = Color(0xff59D5FC);
  static const Color darkBlue = Color(0xff4D7DF6);
  static const Color purple = Color(0xff9A97D5);
  static const Color blackBlue = Color(0xff007AFF);
}

abstract class BC {
  static Color get green => ThemeColors.green;

  static Color get darkGreen => ThemeColors.darkGreen;

  static Color get blueGreen => ThemeColors.blueGreen;

  static Color get blue => ThemeColors.blue;

  static Color get white => ThemeColors.white;

  static Color get black => ThemeColors.black;

  static Color get darkBlue => ThemeColors.darkBlue;

  static Color get greyGreen => ThemeColors.greyGreen;

  static Color get blackGreen => ThemeColors.blackGreen;

  static Color get purple => ThemeColors.purple;

  static Color get blackBlue => ThemeColors.blackBlue;
}

abstract class BS {
  static TextStyle get bold40 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 40,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold35 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 35,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold32 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 32,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold26Grotesk => GoogleFonts.spaceGrotesk(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 26,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold24 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 24,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold20 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 20,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get bold18 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 18,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w700),
      );

  static TextStyle get sb18 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 18,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w600),
      );

  static TextStyle get sb17 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 17,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w600),
      );

  static TextStyle get med18 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 18,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w500),
      );

  static TextStyle get reg24 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 24,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w400),
      );

  static TextStyle get reg18 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 18,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w400),
      );

  static TextStyle get reg16 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 16,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w400),
      );

  static TextStyle get reg15 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 15,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w400),
      );

  static TextStyle get reg13 => GoogleFonts.poppins(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 13,
            // height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w400),
      );

  static TextStyle get light25 => GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 25,
            height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w300),
      );

  static TextStyle get light18 => GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 18,
            height: 1.28,
            // letterSpacing: 0.09,
            fontWeight: FontWeight.w300),
      );

  static TextStyle get light14 => GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 14,
            height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w300),
      );

  static TextStyle get light13 => GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: BC.white,
            fontSize: 14,
            height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w300),
      );

  static TextStyle get light12 => GoogleFonts.montserrat(
        textStyle: TextStyle(
            color: BC.black,
            fontSize: 12,
            height: 1.28,
            letterSpacing: 0.09,
            fontWeight: FontWeight.w300),
      );
}

abstract class BDuration {
  static Duration get d200 => const Duration(milliseconds: 200);
}

abstract class BRadius {
  static BorderRadius get r50 => const BorderRadius.all(Radius.circular(50));

  static BorderRadius get r32 => const BorderRadius.all(Radius.circular(32));

  static BorderRadius get r21 => const BorderRadius.all(Radius.circular(21));

  static BorderRadius get r16 => const BorderRadius.all(Radius.circular(16));

  static BorderRadius get r14 => const BorderRadius.all(Radius.circular(14));

  static BorderRadius get r10 => const BorderRadius.all(Radius.circular(10));
}

abstract class BShadow {
  static List<BoxShadow> get light => [
        BoxShadow(
            color: BC.green.withOpacity(0.1),
            blurRadius: 60,
            offset: const Offset(0, 2))
      ];
}
