import 'package:flutter/material.dart';

class Utils {
  static List<CustomStyleText> children = [];

  static addStyle (CustomStyleText styleText)
   {
      children.add(styleText);
   }
}
class CustomStyleText {
  int start , end ;
  TextStyle textStyle ;
  CustomStyleText({this.start, this.end, this.textStyle});



}