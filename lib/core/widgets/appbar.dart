import 'package:flutter/material.dart';

import 'headline.dart';

AppBar mainTitle(String text) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: HeadLine(text: text),
  );
}
