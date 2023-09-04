/*
  QRCode Generator (Card Number)
   
  @description: Generate QRCode for the provided card number provided by Yasham Media
   

   Author: Amgad Fahd
*/

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator {
  /// [generateQRCodeFromCardNumber] -- Generate QRCodeFromCardNumber
  static void generateQRCodeFromCardNumber() {}
}

class QrCodeWidget extends StatelessWidget {
  final String cardNumber;
  final ImageProvider<Object>? embeddedImage;
  final QrEmbeddedImageStyle? embeddedImageStyle;
  final bool gapless;
  final EdgeInsets padding;
  final double? size;
  final Color backgroundColor;
  const QrCodeWidget({
    super.key,
    required this.cardNumber,
    this.gapless = true,
    this.padding = const EdgeInsets.all(10.0),
    this.size,
    this.backgroundColor = Colors.transparent,
    this.embeddedImage,
    this.embeddedImageStyle,
  });

  @override
  Widget build(BuildContext context) {
    return QrImageView(
      data: cardNumber,
      version: QrVersions.auto,
      embeddedImage: embeddedImage,
      embeddedImageStyle: embeddedImageStyle,
      gapless: gapless,
      padding: padding,
      size: size,
      backgroundColor: backgroundColor,
    );
  }
}
