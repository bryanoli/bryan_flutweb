import 'package:flutter/material.dart';

class SummaryWidget extends StatelessWidget {
  final String text;

  const SummaryWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
