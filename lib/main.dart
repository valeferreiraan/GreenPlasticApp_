import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greenplastic_app/constants.dart';
import 'package:greenplastic_app/ui/pages/home.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Green Plastic App',
      theme: ThemeData(
        colorScheme: flexSchemeLight,
        fontFamily: 'Julius Sans One',
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.juliusSansOne(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
          ),
          headlineLarge: GoogleFonts.luckiestGuy(
            fontSize: 45.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            shadows: [
              Shadow(blurRadius: 2.0, color: Color1, offset: Offset(1.0, 1.0))
            ],
          ),
          labelLarge: GoogleFonts.juliusSansOne(
            fontSize: 24.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        primaryTextTheme: GoogleFonts.juliusSansOneTextTheme(),
        scaffoldBackgroundColor: mainColor,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
