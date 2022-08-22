import 'package:flutter/material.dart';

class ModuleTitleText extends StatelessWidget {
  final String text;
  const ModuleTitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "GoogleSans",
            color: Color(0xfffafafa).withOpacity(0.8),
            fontSize: 24),
        textAlign: TextAlign.start,
      ),
    );
  }
}
