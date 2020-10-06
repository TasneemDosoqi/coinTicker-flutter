

import 'package:flutter/material.dart';
//colors
const Color kWhite = Color(0xffFFFFFF);
const Color kLightGray = Color(0xffF4F7F9);
const Color kFillGray = Color(0xffF1F6FA);
const Color kGray = Color(0xff717E8B);
const Color kBlue = Color(0xff44AAF2);
const Color kGreen = Color(0xff54D3AD);

const TextStyle kTitleStyle = TextStyle( color: Color(0xff717E8B) , fontSize: 22 );
const TextStyle kButtonStyle = TextStyle( color: Color(0xffFFFFFF) , fontSize: 22 );
const TextStyle kMessageStyle = TextStyle( color: Color(0xff717E8B) , fontSize: 16, fontWeight: FontWeight.w600 );
const TextStyle kBigNumStyle = TextStyle( color: Color(0xff717E8B) , fontSize: 30, fontWeight: FontWeight.w600);

BoxShadow containerShadow( Color shadowColor) {
  return BoxShadow(
    color: shadowColor,
    offset: Offset(0, 2),
    spreadRadius: -1,
    blurRadius: 7,
  );
}