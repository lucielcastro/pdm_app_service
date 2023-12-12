import 'package:app_servicos/app/pages/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'app/pages/login_page/login_page.dart';
import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'app/routes/routes.dart';

class AuthController extends GetxController {
  //AuthController.instance
  static AuthController instance = Get.find();
  //email, password, name
  Rx<User?> _user = Rx<User?>(FirebaseAuth.instance.currentUser);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? get user => _user.value;
  RxBool loading = false.obs;
  // Box boxData = Hive.box("data");
  FirebaseAuth auth = FirebaseAuth.instance;
  //a
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //nosso user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreem);
  }

  _initialScreem(User? user) {
    if (user == null) {
      print('login page');
      Get.offAll(() => const LoginPage());
    } else {
      Get.offAll(() => HomePage(email: user.email!));
    }
  }

  void register(String email, password, name, surname) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await firestore.collection('users').doc(result.user!.uid).set({
          'name': name,
          'surname': surname,
          'email': email,
          'password': password,
          // Adicione mais campos conforme necessário
        });
      }
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: const Text(
            'Erro ao criar a conta',
            style: TextStyle(color: Colors.white),
          ),
          messageText: const Text(
            "Verifique se o seu Email está correto",
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About Login", "Login message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          titleText: const Text(
            'Login Falhou',
            style: TextStyle(color: Colors.white),
          ),
          messageText: const Text(
            "Seu Email ou Senha estão incorretos!",
            style: TextStyle(color: Colors.white),
          ));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      } else {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // User? user = FirebaseAuth.instance.currentUser;
        // String? photoUrl = user?.photoURL;
        // String? displayName = user?.displayName;

        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Erro",
        e.toString(),
      );
      return null;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    await auth.signOut();
    googleSignIn.signOut();

    Get.offAllNamed(Routes.login);
  }
}
