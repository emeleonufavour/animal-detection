import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class ImageController extends GetxController {
  File? _image;
  List? _output;
  final picker = ImagePicker();

  get image => _image;
  get output => _output;

  set image(value) {
    _image = value;
    update();
  }

  set output(value) {
    _output = value;
    update();
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/models/model_unquant.tflite',
        labels: 'assets/models/labels.txt');
  }

  classifyImage(File image) async {
    var outputT = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    output = outputT;
    //_isloading = false;

    log('This is the output: ${_output!.length}');
  }

  pickImage(bool isCamera) async {
    var imageT = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (imageT == null) {
      return null;
    }

    image = File(imageT.path);

    classifyImage(_image!);
  }
}
