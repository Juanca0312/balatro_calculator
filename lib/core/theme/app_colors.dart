import 'package:flutter/material.dart';

const _green = Color(0xFF3CB06F);
const _lightGreen = Color(0xFFDEFFC9);

extension ExtensionsLighTheme on ColorScheme {
  Color get green => _green;
  Color get lightGreen => _lightGreen;
}
