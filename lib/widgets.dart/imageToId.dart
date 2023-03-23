import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../utils.dart';

class ImageToID extends StatelessWidget {
  final List output;
  final File image;
  const ImageToID({required this.output, required this.image, super.key});

  String removeNumbers(String inputString) {
    // Create an empty string to hold the result
    String result = "";

    // Loop through each character in the input string
    for (int i = 0; i < inputString.length; i++) {
      // Check if the current character is not a number
      if (inputString[i].toLowerCase() != '0' &&
          inputString[i].toLowerCase() != '1' &&
          inputString[i].toLowerCase() != '2' &&
          inputString[i].toLowerCase() != '3' &&
          inputString[i].toLowerCase() != '4' &&
          inputString[i].toLowerCase() != '5' &&
          inputString[i].toLowerCase() != '6' &&
          inputString[i].toLowerCase() != '7' &&
          inputString[i].toLowerCase() != '8' &&
          inputString[i].toLowerCase() != '9') {
        // If the character is not a number, add it to the result string
        result += inputString[i];
      }
    }

    // Return the result string
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.file(image),
        ),
        const SizedBox(
          height: 20,
        ),
        output != null
            //'${}'
            ? Text(
                'This is an image of a${removeNumbers(output[0]['label'].toString().toLowerCase())}',
                style: Utils.normal)
            : Text(
                'Output is empty',
                style: Utils.normal,
              ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
