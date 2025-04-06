
import 'package:flutter/material.dart';

Widget buildSection(String title, String content) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Text(content, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
      Divider(height: 30),
    ],
  );
}
