import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  Map data;
  final child;
  SearchWidget({super.key, required this.data, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                //margin: EdgeInsets.symmetric(horizontal: 20),
                height: 160,
                width: 250,

                //color: Colors.grey[500],
                child: Column(
                  children: [
                    ...data["location"].map((e) {
                      return Image.asset(
                        '$e', fit: BoxFit.cover,

                        //color: ConstColors.black,
                      );
                    })
                  ],
                )),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["address"][0],
                    style: TextStyle(
                        fontSize: 15,
                        //fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                  Text(
                    data["address"][1],
                    style: TextStyle(
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                        color: Colors.grey[800]),
                  ),
                  Container(
                    child: child,
                  )
                ],
              ),
              Text(
                data["distance"],
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
