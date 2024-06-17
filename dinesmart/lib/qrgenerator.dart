// qrgenerator.dart

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'restaurants.dart'; // Import your Restaurant class and allRestaurants list

class QRGenerator {
  static Future<Uint8List?> generateQRCode(Restaurant restaurant) async {
    // Create a key for the widget to render
    GlobalKey qrWidgetKey = GlobalKey();

    // Create a string representing the restaurant's menu
    String menuString = _buildMenuString(restaurant);

    // Encode the menu string to bytes
    Uint8List bytes = utf8.encode(menuString);

    // Generate QR code using qr_flutter package
    return await _generateQRCodeWithWidget(bytes, qrWidgetKey);
  }

  static Future<Uint8List?> _generateQRCodeWithWidget(
      Uint8List bytes, GlobalKey qrWidgetKey) async {
    try {
      // Render QR code widget as an image
      RenderRepaintBoundary boundary = qrWidgetKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print('Error generating QR code: $e');
      return null;
    }
  }

  static String _buildMenuString(Restaurant restaurant) {
    // Prepare menu string with categories, items, and prices
    StringBuffer menuBuffer = StringBuffer();
    menuBuffer.writeln('Restaurant: ${restaurant.name}');
    for (var category in restaurant.menu) {
      menuBuffer.writeln('\n${category.name}:');
      for (var item in category.items) {
        menuBuffer
            .writeln('${item.name} - Nrs ${item.price.toStringAsFixed(2)}');
      }
    }
    return menuBuffer.toString();
  }
}
