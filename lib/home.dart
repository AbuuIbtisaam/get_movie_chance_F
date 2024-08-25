import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late InAppWebViewController webViewController;

  @override
  void initState() {
    super.initState();
    requestPermissions();
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Permission.location,
      Permission.storage,
      Permission.contacts,
    ].request();

    if (statuses[Permission.camera]!.isDenied) {
      // Handle camera permission denied
    }
    if (statuses[Permission.microphone]!.isDenied) {
      // Handle microphone permission denied
    }
    if (statuses[Permission.location]!.isDenied) {
      // Handle location permission denied
    }
    if (statuses[Permission.storage]!.isDenied) {
      // Handle storage permission denied
    }
    if (statuses[Permission.contacts]!.isDenied) {
      // Handle contacts permission denied
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri.uri(Uri.parse('https://getmoviechance.com/')),
          ),
          initialSettings: InAppWebViewSettings(
            javaScriptEnabled: true,
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
