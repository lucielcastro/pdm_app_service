import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rx<User?> firebaseUser = Rx<User?>(null);
  Rx<Map<String, dynamic>> userData = Rx<Map<String, dynamic>>({});

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      firebaseUser.value = user;
      if (user != null) {
        _getUserData(user.uid);
      }
    });
  }

  Future<void> _getUserData(String userId) async {
    DocumentSnapshot userSnapshot =
        await _firestore.collection('users').doc(userId).get();

    //tratamento de erro, se o user não existir
    if (userSnapshot.exists) {
      userData.value = userSnapshot.data() as Map<String, dynamic>;
    } else {
      userData.value = {};
    }
  }
}
