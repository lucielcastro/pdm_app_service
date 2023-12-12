import 'package:flutter/material.dart';
import '../const_colors.dart';

class TextTitle extends StatelessWidget {
  final String? textTitle;
  final Color? textColor;
  final double? fontSize;
  bool alignTitle;
  bool paddingText;

  TextTitle({
    super.key,
    required this.textTitle,
    this.textColor,
    this.fontSize,
    this.alignTitle = false,
    this.paddingText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingText
          ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
          : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        textTitle!,
        textAlign: alignTitle ? TextAlign.center : TextAlign.left,
        style: TextStyle(
          color: textColor ?? ConstColors.black,
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 20,
        ),
      ),
    );
  }
}
