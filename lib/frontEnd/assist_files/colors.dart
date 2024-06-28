
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const DEEP_BLUE = Color.fromRGBO(20, 106, 255, 1);
const SILVER = Color.fromARGB(255, 238, 238, 238);

Color lightenColor(Color color, [double amount = 0.1]) {
  assert(amount >= 0 && amount <= 1);

  final int red = (color.red + ((255 - color.red) * amount)).round();
  final int green = (color.green + ((255 - color.green) * amount)).round();
  final int blue = (color.blue + ((255 - color.blue) * amount)).round();

  return Color.fromRGBO(red, green, blue, color.opacity);
}

Color darkenColor(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);
  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
  return hslDark.toColor();
}