
import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  navigateto(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (_)=> screen));
  }
}
