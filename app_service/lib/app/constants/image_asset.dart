import 'package:flutter/material.dart';

class ImageAsset extends StatelessWidget {
  final String image;
  final double? imageH;

  const ImageAsset({
    Key? key,
    required this.image,
    this.imageH = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$image.png',
      height: imageH,
    );
  }
}
