import 'package:flutter/material.dart';
import 'package:geo_tag_camera/geo_tag_camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GeoImageObject? _result;

  Future<void> _openCamera() async {
    final GeoImageObject? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) =>  CameraPage()),
    );

    if (result != null) {
      setState(() => _result = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GPS Camera')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _result == null
                  ? const Center(child: Text('No Image'))
                  : InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: Center(
                  child: Image.file(
                    _result!.imageFile,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: _openCamera,
                child: const Text('Open Camera'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}