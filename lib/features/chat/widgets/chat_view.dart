import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatWebView extends StatefulWidget {
  final String url;

  const ChatWebView({super.key, required this.url});

  @override
  State<ChatWebView> createState() => _ChatWebViewState();
}

class _ChatWebViewState extends State<ChatWebView> {

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}