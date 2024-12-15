import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color getTextColor() {
    Color backgroundColor = this;
    double brightness = (backgroundColor.r * 0.299 + backgroundColor.g * 0.587 + backgroundColor.b * 0.114) / 255;
    return brightness >= 0.6 ? Colors.black : Colors.white;
  }
}
