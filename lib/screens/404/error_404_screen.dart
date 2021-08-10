import 'package:flutter/material.dart';
import 'package:flutter_responsive_website/screens/404/body.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFCC02),
      body: Body(),
    );
  }
}
