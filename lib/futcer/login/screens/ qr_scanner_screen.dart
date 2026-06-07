// qr_scanner_screen.dart
import 'package:auth_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _hasScanned = false;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.myBlack,
      appBar: AppBar(
        backgroundColor: ColorsManager.myBlack,
        iconTheme: const IconThemeData(color: ColorsManager.myWhite),
        title: const Text("مسح رمز QR", style: TextStyle(color: ColorsManager.myWhite)),
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            color: ColorsManager.myWhite,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            icon: const Icon(Icons.flip_camera_ios),
            color: ColorsManager.myWhite,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera view
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              if (_hasScanned) return;

              final barcode = capture.barcodes.first;
              final String? code = barcode.rawValue;

              if (code != null) {
                setState(() => _hasScanned = true);

                // TODO: handle the scanned value
                debugPrint('QR Code: $code');

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('تم المسح: $code'), backgroundColor: ColorsManager.myBlue));

                Navigator.pop(context, code);
              }
            },
          ),

          // Overlay with scan frame
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: ColorsManager.myBlue, width: 3),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),

          // Hint text
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: const Text(
              "ضع رمز QR داخل الإطار",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorsManager.myWhite, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
