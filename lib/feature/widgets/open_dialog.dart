import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openDialog(String type, String text) {
  Get.dialog(
    AlertDialog(
      title: Text(type),
      content: Text(text),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );
}