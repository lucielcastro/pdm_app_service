import 'package:flutter/material.dart';
import '../../../constants/const_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: h * 0.02),
      child: Row(
        children: <Widget>[
          biudDivider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OU",
              style: TextStyle(
                  color: ConstColors.cutGrey, fontWeight: FontWeight.w600),
            ),
          ),
          biudDivider(),
        ],
      ),
    );
  }

  Expanded biudDivider() {
    return const Expanded(
      child: Divider(
        color: Color(0xffd9d9d9),
        height: 1.5,
      ),
    );
  }
}
