import 'package:app_servicos/app/pages/login_page/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/routes.dart';
import 'auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String redirect() {
      return Routes.login;
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: redirect(),
      // home: LoginPage(),
      getPages: AppPages.pages,
      
    );
  }
}
