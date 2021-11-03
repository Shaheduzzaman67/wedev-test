import 'package:flutter/material.dart';
import 'package:wedev_test/const/local_color.dart';



Widget text(String text,
    {double fontSize = 14,
      textColor = textColorPrimary,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        letterSpacing: latterSpacing),
  );
}


Widget boldtext(String text,
    {double fontSize = 16,
      textColor = textColorPrimary,
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.5}) {
  return Text(
    text,
    textAlign: isCentered ? TextAlign.center : TextAlign.start,
    maxLines: maxLine,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        height: 1.5,
        fontWeight: FontWeight.bold,
        letterSpacing: latterSpacing),
  );
}
