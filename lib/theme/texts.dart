import 'package:flutter/material.dart';

class AppTextStyles{

  // Estilo H1
  static TextStyle get headline1 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 47.78,
        fontWeight: FontWeight.w400,
      );

  // Estilo H2
  static TextStyle get headline2 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 39.81,
        fontWeight: FontWeight.w400,
      );
  // Estilo H3
   static TextStyle get headline3 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 33.18,
        fontWeight: FontWeight.w400,
      );
  // Estilo H4
   static TextStyle get headline4 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 27.65,
        fontWeight: FontWeight.w400,
      );
  // Estilo H5
   static TextStyle get headline5 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 23.04,
        fontWeight: FontWeight.w400,
      );

   static TextStyle get headline5Semi => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 23.04,
        fontWeight: FontWeight.w600,
      );
  //Estilo H6
  static TextStyle get headline6 => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 19.2,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headline6Semi => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 19.2,
        fontWeight: FontWeight.w600,
      );
  //Estilo P
  static TextStyle get paragraph => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get paragraphSemi => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w600,
      );
  //Estilo Body Base
  static TextStyle get bodyBase => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  //Estilo Caption
    static TextStyle get caption => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 13.33,
        fontWeight: FontWeight.w400,
      );
    
    static TextStyle get captionBold => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 13.33,
        fontWeight: FontWeight.w700,
      );
  //Estilo Small
  static TextStyle get small => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 11.11,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get smallMedium => const TextStyle(
        fontFamily: 'Inter',
        fontSize: 11.11,
        fontWeight: FontWeight.w500,
      );
}