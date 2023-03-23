import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_detection/controller.dart';
import 'package:pet_detection/utils.dart';
import 'package:pet_detection/widgets.dart/emptyImage.dart';
import 'package:pet_detection/widgets.dart/imageToId.dart';
import 'package:tflite/tflite.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ctr = Get.put(ImageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctr.loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(
                height: 6,
              ),
              Text(
                'Animal detection',
                style: Utils.heading,
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ImageController>(
                builder: (imageCtr) => Center(
                    child: imageCtr.image == null
                        ? EmptyImage()
                        : ImageToID(
                            output: imageCtr.output, image: imageCtr.image)),
              ),
              GestureDetector(
                onTap: () {
                  return ctr.pickImage(true);
                },
                child: Container(
                  width: size.width * 1 / 2,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Take a photo',
                    style: Utils.buttonText,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  return ctr.pickImage(false);
                },
                child: Container(
                  width: size.width * 1 / 1.5,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Choose a photo',
                    style: Utils.buttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
