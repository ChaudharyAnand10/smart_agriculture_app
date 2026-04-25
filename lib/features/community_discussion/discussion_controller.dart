import 'dart:io';
import 'package:agro_app/cloudinary_service/cloudinary_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'discussion_model.dart';

class DiscussionController extends GetxController {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isLoading = false.obs;

  File? selectedImage;

  void setImage(File file) {
    selectedImage = file;
    update();
  }

  Future<void> sendDiscussion({
    required String question,
    required String description,
    required String userId,
    required String userName,
  }) async {
    try {

      // 🔴 VALIDATION
      if (selectedImage == null ||
          question.isEmpty ||
          description.isEmpty) {
        Get.snackbar("Error ❌", "Fill all fields & select image");
        return;
      }

      isLoading.value = true;

      // ☁️ Upload image to Cloudinary
      String? imageUrl =
          await CloudinaryService.uploadImage(selectedImage!);

      if (imageUrl == null) {
        Get.snackbar("Error ❌", "Image upload failed");
        return;
      }

      String id = DateTime.now().millisecondsSinceEpoch.toString();

      // 🧠 CREATE MODEL (FIXED)
      DiscussionModel model = DiscussionModel(
        id: id,
        userId: userId,        // ✅ FIXED (NOT FirebaseAuth again)
        userName: userName,    // ✅ ADD THIS FIELD IN MODEL
        imageUrl: imageUrl,
        question: question,
        description: description,
      );

      // 💾 SAVE TO FIRESTORE
      await firestore
          .collection("doubts")
          .doc(id)
          .set(model.toMap());

      Get.snackbar("Success ✅", "Discussion posted");

      Get.back();

    } catch (e) {
      Get.snackbar("Error ❌", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}