import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/screens/home/home_screen.dart';
// import 'package:flutter_responsive_website/screens/main/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // we are using dark theme and we modify it as our need
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        canvasColor: kBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white)
            .copyWith(
              bodyText1: const TextStyle(color: kTextBodyColor),
              bodyText2: const TextStyle(color: kTextBodyColor),
            ),
      ),
      home: const HomeScreen(),
      // home: MainScreen(
      //   children: [
      //     FittedBox(
      //       fit: BoxFit.fill,
      //       child: Container(
      //         color: Colors.blue,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
