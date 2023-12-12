import 'package:flutter/material.dart';

class ConversationshWidget extends StatelessWidget {
  Map data;
  final child;

  ConversationshWidget({super.key, required this.data, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      data["user"],
                      style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        child: Column(
                          children: [
                            // ...data["perfil"].map(
                            //   (e) {
                            //     return Padding(
                            //       padding: const EdgeInsets.only(right: 10),
                            //       child: Image.asset(
                            //         '$e',
                            //         fit: BoxFit.cover,
                            //       ),
                            //     );
                            //   },
                            // )
                          ],
                        )),
                  ],
                ),
              ),
              Text(
                data["hora"],
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
