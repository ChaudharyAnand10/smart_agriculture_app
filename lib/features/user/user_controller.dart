import 'package:agro_app/features/user/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main_screen.dart';
import 'user_model.dart';

class UserController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

  // ---------------- SIGNUP ----------------
  Future<void> signup(String name, String email, String password) async {
    try {
      isLoading.value = true;

      UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
        uid: cred.user!.uid,
        name: name,
        email: email,
      );

      await firestore.collection("users").doc(user.uid).set(user.toMap());

      Get.snackbar(
        "Success ✅",
        "Signup successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAll(() => const MainScreen());

    } catch (e) {
      Get.snackbar(
        "Signup Failed ❌",
        "Something went wrong",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // ---------------- LOGIN ----------------
  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.snackbar(
        "Success ✅",
        "Login successful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.offAll(() => const MainScreen());

    } catch (e) {
      Get.snackbar(
        "Login Failed ❌",
        "Invalid credentials",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> logout() async {
  try {
    await auth.signOut();

    Get.snackbar(
      "Logged Out 🚪",
      "You have been signed out successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(12),
    );

    Get.offAll(() => LoginScreen());

  } catch (e) {
    Get.snackbar(
      "Error ❌",
      "Logout failed",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


Future<String> getUserName(String uid) async {
  final doc = await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .get();

  return doc['name'] ?? "Unknown";
}
}