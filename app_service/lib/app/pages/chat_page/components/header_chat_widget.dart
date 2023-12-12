import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/const_colors.dart';
import '../../../constants/image_asset.dart';
import '../../../constants/svg_asset.dart';


class HeaderWidget extends StatelessWidget {
  final onTap;
  const HeaderWidget({
    super.key,
    required this.data,
    this.onTap,
  });

  final Map data;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: const BoxDecoration(
    //     color: ConstColors.white,
    //     border: Border(
    //       bottom: BorderSide(
    //         color: ConstColors.backgroundGrey,
    //         width: 1,
    //       ),
    //     ),
    //   ),
    //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       SizedBox(height: 40),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           InkWell(
    //             onTap: () => Get.back(),
    //             child: const Icon(
    //               Icons.arrow_back_ios_new_rounded,
    //               color: ConstColors.black,
    //             ),
    //           ),
    //           Text(
    //             'Pedro Eletricista',
    //             style: const TextStyle(
    //                 color: ConstColors.black,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.w600),
    //           ),
    //           SizedBox(
    //             width: 10,
    //           ),
    //         ],
    //       )
    //     ],
    //   ),
    // );

    return Container(
      // alignment: Alignment.topCenter,
      width: Get.width,
      // width: 200,
      decoration: const BoxDecoration(
        color: ConstColors.orange,
      ),
      margin: const EdgeInsets.symmetric(vertical: 30),
      // padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // if (showButton)
          InkWell(
            onTap: () => Get.back(),
            child: SvgAsset(
              image: "angle_left",
              color: ConstColors.white,
            ),
          ),
          // TextDescription(textDescription: 'José Carlos Cabelos',),
          Text(
            data["user"],
            style: TextStyle(
                fontSize: 18,
                //fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          ImageAsset(
            image: 'logo-main',
            imageH: 50,
          ),
        ],
      ),
    );
  }
}
