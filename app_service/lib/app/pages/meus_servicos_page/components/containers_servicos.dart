import 'package:flutter/material.dart';
import '../../../constants/const_colors.dart';

class ContainersServicos extends StatelessWidget {
  Map dados;
  final onTap;

  ContainersServicos({super.key, required this.dados, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Column(
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
            // margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: dados['status'] == 'Analizando'
                  ? ConstColors.normalRed
                  : dados['status'] == 'Em andamento'
                      ? ConstColors.blue
                      : ConstColors.yellow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      ),
    );
  }
}
