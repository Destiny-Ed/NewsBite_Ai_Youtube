import 'package:flutter/material.dart';

class VideoPreviewScreen extends StatefulWidget {
  final String videoScript;
  const VideoPreviewScreen({super.key, required this.videoScript});

  @override
  State<VideoPreviewScreen> createState() => _VideoPreviewScreenState();
}

class _VideoPreviewScreenState extends State<VideoPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Generated Video")));
  }
}
