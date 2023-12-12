import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const_colors.dart';
import '../../svg_asset.dart';
import '../../text/text_title.dart';

class TextIcon extends StatelessWidget {
  final String? textButton;
  final String iconButton;

  final width;
  final onTap;

  const TextIcon({
    super.key,
    this.textButton,
    this.onTap,
    this.width,
    required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgAsset(
              image: iconButton,
              color: ConstColors.black,
              imageH: 18,
              // imageW: 12,
            ),
            SizedBox(width: 10),
            TextTitle(
              textTitle: textButton!,
              fontSize: 18,
            ),
            // SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
//width
