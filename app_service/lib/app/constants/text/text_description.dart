import 'package:flutter/material.dart';
// import 'package:hamburgueria/app/constants/const_colors.dart';

import '../const_colors.dart';

class TextDescription extends StatelessWidget {
  final String? textDescription;
  final Color? color;
  final double? fontSize;
  bool alignText;
  bool paddingText;

  TextDescription({
    super.key,
    required this.textDescription,
    this.color,
    this.fontSize,
    this.alignText = false,
    this.paddingText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingText
          ? EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          : EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        textDescription!,
        textAlign: alignText ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          color: color ?? ConstColors.black,
          fontWeight: FontWeight.w300,
          fontSize: fontSize ?? 16,
        ),
      ),
    );
  }
}
