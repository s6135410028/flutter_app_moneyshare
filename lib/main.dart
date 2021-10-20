import 'package:flutter/material.dart';
import 'package:flutter_app_moneyshare/views/home_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
