import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String text;

  Resultado(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
