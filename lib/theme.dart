import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const Map<String, Color> palettes = {
  'primary': Color(0xFF5843BE),
  'accent': Color(0xFFFF9376),
  'text1': Color(0xFF000000),
  'text2': Color(0xFF82868E),
  'canvas': Color(0xFFF6F7F8),
  'unfocus': Color(0xFF989BA1)
};

final TextStyle headline = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.w500,
  color: palettes['text1']
);

final TextStyle subheadline = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w300,
  color: palettes['text2']
);

const TextStyle mainbutton = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: Colors.white
);