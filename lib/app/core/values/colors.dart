import 'package:flutter/material.dart';
import 'package:task_file_app/app/core/values/images.dart';

// ?? color
const purple = Color(0xFF756BFC);
const pink = Color(0xFFF1A39A);
const deepPink = Color(0xFFFA63C6);
const green = Color(0xFF41CF9F);
const yellow = Color(0xFFEEC38E);
const lightBlue = Color(0xFF42A5F5);
const blue = Color(0xFF2B60B6);
const red = Color(0xFFE74C3C);
const orange = Color(0xFFE67E22);

const avOneColor = Color(0xFFE6D200);
const avTwoColor = Color(0xFFB3E820);
const avThreeColor = Color(0xFFFFAF19);
const avFourColor = Color(0xFFE8B90E);
const avFiveColor = Color(0xFF00A619);

const textColor = Color(0xFFCFCAC8);

// !! Color Selection Function
Color colorSelectionFunction(type) {
  if (type == avOneImg) {
    return avOneColor;
  } else if (type == avTwoImg) {
    return avTwoColor;
  } else if (type == avThreeImg) {
    return avThreeColor;
  } else if (type == avFourImg) {
    return avFourColor;
  } else {
    return avFiveColor;
  }
}