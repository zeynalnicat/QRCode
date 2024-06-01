import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({super.key});

  @override
  State<GenerateQRScreen> createState() => _GenerateQRScreenState();
}



class _GenerateQRScreenState extends State<GenerateQRScreen> {
  final GlobalKey key = GlobalKey();
  String qrStr = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          RepaintBoundary(
            key: key,
            child: Container(
              child: Center(
                child: qrStr.isEmpty
                    ? const Text(
                  "Enter Data For Generating QR Code",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                )
                    : QrImage(
                  data: qrStr,
                  version: QrVersions.auto,
                  size: 200,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Enter data",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  qrStr = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

