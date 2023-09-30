import 'package:flutter/material.dart';

Color hexToColor(String hexCode) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hexCode),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hexCode.substring(1), radix: 16) +
        (hexCode.length == 7 ? 0xff000000 : 0x00000000),
  );
}