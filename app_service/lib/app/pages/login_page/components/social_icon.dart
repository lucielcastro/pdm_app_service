import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/image_asset.dart';
import '../../../constants/svg_asset.dart';
import '../../../constants/text/text_description.dart';

class SocialIcon extends StatelessWidget {
  final onTap;
  final String icon;
  final String textButton;
  const SocialIcon({
    super.key,
    required this.icon,
    this.onTap,
    required this.textButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: ConstColors.cutGrey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ImageAsset(
              image: 'google',
            ),
            TextDescription(
              textDescription: textButton,
              fontSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}
