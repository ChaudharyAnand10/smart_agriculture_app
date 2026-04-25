import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'discussion_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AskQuestionScreen extends StatelessWidget {
  AskQuestionScreen({super.key});

  final controller = Get.put(DiscussionController());

  final question = TextEditingController();
  final description = TextEditingController();

  // 🔥 USER NAME FETCH FUNCTION
  Future<String> getUserName() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get();

    return doc['name'] ?? "User";
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      controller.setImage(File(file.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Solution"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Pick Image"),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: question,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: "Your question to the community",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: description,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Description of your problems",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () async {

                      // 🔴 VALIDATION
                      if (question.text.isEmpty ||
                          description.text.isEmpty ||
                          controller.selectedImage == null) {
                        Get.snackbar(
                          "Error ❌",
                          "Fill all fields & select image",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      // 🔥 GET USER NAME
                      String name = await getUserName();

                      // 🔥 SEND DATA (IMPORTANT ADD HERE)
                      controller.sendDiscussion(
                        question: question.text,
                        description: description.text,
                        userId: FirebaseAuth.instance.currentUser!.uid,
                        userName: name,
                      );
                    },

              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Send"),
            )),
          ],
        ),
      ),
    );
  }
}