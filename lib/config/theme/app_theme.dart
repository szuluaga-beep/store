

import 'package:flutter/material.dart';

const colorSeed=Color(0xff2f5797);
const scaffoldBackgroundColor=Color(0xfff5f5f5);

class AppTheme{

  ThemeData getTheme()=>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorSeed,

    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );
}