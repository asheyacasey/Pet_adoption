import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'src/screens/login/auth_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.soraTextTheme(
            Theme.of(context).textTheme,
          )
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),

    );
  }
}