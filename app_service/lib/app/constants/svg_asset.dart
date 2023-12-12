import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String image;
  final double imageH;
  final Color? color;

  const SvgAsset({
    Key? key,
    required this.image,
    this.imageH = 25,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$image.svg',
      height: imageH,
      color: color,
    );
  }
}
