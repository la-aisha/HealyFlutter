import 'package:flutter/cupertino.dart';

import 'dart:html';
import 'dart:ui';

class TitleOption extends Text {
  TitleOption(
    {required data,
    required Color color,
    required double size,
    required FontWeight weight,
    required FontStyle? style})
    : super(data,
    style: TextStyle(
    
    color: color,
    fontSize: size,
    fontStyle: style,
    fontWeight: weight));
}
