import 'dart:io';

import 'package:arch_team_power/features/camera/presentation/screens/widget/custom_bottom_bar.dart';
import 'package:arch_team_power/features/camera/presentation/screens/widget/custom_camera_app_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver_plus/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreenBody extends StatefulWidget {
  const CameraScreenBody({super.key});

  @override
  State<CameraScreenBody> createState() => _CameraScreenBodyState();
}

class _CameraScreenBodyState extends State<CameraScreenBody> {
  CameraController? controller;
  List<CameraDescription>? cameras;
  double zoom = 1.0;
  File? selectedImage;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    try {
      if (controller != null) {
        await controller!.dispose();
        controller = null;
      }

      cameras = await availableCameras();

      if (cameras == null || cameras!.isEmpty) {
        debugPrint("No cameras available");
        return;
      }

      controller = CameraController(
        cameras!.first,
        ResolutionPreset.max,
        enableAudio: false,
      );

      await controller!.initialize();

      if (!mounted) return;

      setState(() {});
    } catch (e, s) {
      debugPrint("Camera init error: $e\n$s");
    }
  }

  Future<void> takePhoto() async {
    final picture = await controller!.takePicture();
    setState(() => selectedImage = File(picture.path));
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => selectedImage = File(image.path));
  }

  Future<void> saveImage() async {
    if (selectedImage != null) {
      await GallerySaver.saveImage(selectedImage!.path);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: selectedImage != null
              ? Image.file(selectedImage!, fit: BoxFit.cover)
              : (controller == null || !controller!.value.isInitialized)
              ? const Center(
                  child: CircularProgressIndicator(color: Color(0xffD2B48C)),
                )
              : GestureDetector(
                  onScaleUpdate: (details) {
                    if (details.scale != 1.0) {
                      setState(() {
                        zoom = (zoom * details.scale).clamp(1.0, 4.0);
                        controller!.setZoomLevel(zoom);
                      });
                    }
                  },
                  child: CameraPreview(controller!),
                ),
        ),

        const Positioned(top: 16, left: 0, right: 0, child: CameraAppBar()),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CustomBottomBar(
            controller: controller,
            onTapPickImage: () => pickImage(),
            onTapSaveImage: () => saveImage(),
            onTapTakePhoto: () => takePhoto(),
          ),
        ),
      ],
    );
  }
}
