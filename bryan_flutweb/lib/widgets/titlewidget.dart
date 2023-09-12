import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double height;
  final TextStyle textStyle;

  const TitleWidget({
    Key? key,
    required this.title,
    this.height = 40,
    this.textStyle = const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: SizedBox(
          height: height,
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

