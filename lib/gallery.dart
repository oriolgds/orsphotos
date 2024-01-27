import 'dart:io';

import 'package:flutter/material.dart';



class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  directory() async {
    final dir = Directory('/sdcard/DCIM/Camera/');
    final List<FileSystemEntity> entities = await dir.list().toList();
    debugPrint("All files: -------------------------------------------");
    for (var element in entities) {
      debugPrint(element.toString());
    }
  }
  @override
  void initState() {
    directory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
