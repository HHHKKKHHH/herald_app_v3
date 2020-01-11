import 'package:flutter/cupertino.dart';

class ColorWithFakeLuminance extends Color {
  final bool withLightLuminance;
  ColorWithFakeLuminance(Color color, {@required this.withLightLuminance})
      : super(color.value);
  double get luminance {
    return withLightLuminance ? 0 : 1;
  }
  double computeLuminance() => luminance;
}
