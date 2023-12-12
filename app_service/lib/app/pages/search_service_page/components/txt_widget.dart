import 'package:flutter/material.dart';

class TxtWidget extends StatelessWidget {
  Map data;
  TxtWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text('Ver mais',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          )),
    );
  }
}
