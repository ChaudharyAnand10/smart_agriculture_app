import 'package:agro_app/constants/app_urls.dart';
import 'package:agro_app/features/chat/widgets/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestMicPermission();
  }

  Future<void> requestMicPermission() async {
    var status = await Permission.microphone.request();

    if (!status.isGranted) {
      print("Microphone permission denied");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Chat 🌱"),
        backgroundColor: Colors.green,
      ),

      body: SafeArea(child: ChatWebView(url: AppUrls.chatbotUrl)),
    );
  }
}
