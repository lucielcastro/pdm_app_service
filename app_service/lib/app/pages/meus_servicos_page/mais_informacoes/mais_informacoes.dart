import 'package:flutter/material.dart';
import '../../../constants/const_colors.dart';

class MaisInformacoes extends StatelessWidget {
  Map dados;

  MaisInformacoes({super.key, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dados['status'],
            style: const TextStyle(
              fontSize: 18,
              color: ConstColors.black,
            ),
          ),
          Container(
            height: 70,
            // margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: ConstColors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  dados['nomeLoja'],
                  style: const TextStyle(
                    fontSize: 18,
                    color: ConstColors.black,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      dados['data'],
                      style: const TextStyle(
                        fontSize: 18,
                        color: ConstColors.black,
                      ),
                    ),
                    Text(
                      dados['horario'],
                      style: const TextStyle(
                        fontSize: 18,
                        color: ConstColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
    );
  }
}
