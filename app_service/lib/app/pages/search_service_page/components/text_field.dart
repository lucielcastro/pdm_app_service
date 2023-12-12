// import 'package:flutter/material.dart';

// import '../../../constants/const_colors.dart';

// class TxtField extends StatelessWidget {
//   TxtField({
//     super.key,
//     this.dadosController,
//     required this.hintTxt,
//     this.onChanged,
//   });
//   final onChanged;
//   final String hintTxt;

//   final TextEditingController? dadosController;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 2, bottom: 2),
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           decoration: BoxDecoration(
//             color: ConstColors.backgroundGrey,
//             borderRadius: BorderRadius.circular(5),
//           ),
//           child: TextFormField(
//             key: Key(hintTxt),
//             autofocus: true,
//             keyboardType: TextInputType.text,
//             cursorColor: ConstColors.black,
//             style: TextStyle(
//               color: ConstColors.black,
//               fontSize: 14,
//               height: 1,
//             ),
//             onChanged: onChanged,
//             controller: dadosController,
//             decoration: InputDecoration(
//               icon: Icon(Icons.search),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(
//                   color: ConstColors.backgroundGrey,
//                   width: 1,
//                 ),
//               ),
//               border: UnderlineInputBorder(),
//               hintStyle: TextStyle(
//                 color: ConstColors.lightGrey,
//                 fontSize: 14,
//                 height: 1,
//               ),
//               hintText: hintTxt,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
