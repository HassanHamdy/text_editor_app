import 'package:flutter/material.dart';
import 'package:text_editor_app/util/utilss.dart';

class MyTextController extends TextEditingController {
  static bool isBold =false;


  @override
  TextSpan buildTextSpan({TextStyle style, bool withComposing}) {
    List<InlineSpan> children = [];
    if (Utils.children.isNotEmpty) {
      Utils.children.forEach((element) {
        if (element.start == text.length)
          {
            Utils.children.removeLast();
          }
          children.add(TextSpan(
              style: element.textStyle,
              text: text.substring(element.start,
                  element.end > text.length ? text.length : element.end)));

      });

      children.add(TextSpan(
          style: TextStyle(
            color: isBold ? Colors.teal : Colors.red,
          ),
          text:text.substring(Utils.children.last.end > text.length ? text.length : Utils.children.last.end, text.length)));
    } else {
      children.add(TextSpan(
          style: TextStyle(
            color: Colors.red,
          ),
          text: text.substring(0, text.length)));
    }
    print(value.text.length);

    return TextSpan(style: style, children: children);
  }
}
