// import 'package:caracolapp/app/pages/routes_page/routes_page.dart';
import 'package:get/get.dart';

class InitialPageController extends GetxController {
  List<Map<String, dynamic>> orders = [
    {
      "delivery_name": "Josué",
      "delivery_date": "20/20/2023",
      "price": 14.00,
      "icon": "box_send"
    },
    {
      "delivery_name": "Marcos",
      "delivery_date": "20/20/2023",
      "price": 20.00,
      "icon": "routes"
    },
    {
      "delivery_name": "Maria",
      "delivery_date": "20/20/2023",
      "price": 15.00,
      "icon": "delivered"
    }
  ];
}
