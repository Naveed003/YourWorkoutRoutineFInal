import 'package:flutter/material.dart';
import 'dart:io';

class MyCircleTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const MyCircleTile({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(100)),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}

class MySquareTile extends StatelessWidget {
  final File? image;
  final Function()? onTap;
  final double width;
  const MySquareTile({
    super.key,
    required this.image,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (width - 10 - 10 - 50) / 3,
        height: (width - 10 - 10 - 50) / 3,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        // child: Image.file(File(imagePath))),
        child: image != null
            ? Image.file(
                image!,
                // width: (width - 10 - 10 - 50) / 3,
              )
            : const Center(
                child: Text(
                '+',
                style: TextStyle(fontSize: 30),
              )),
      ),
    );
  }
}
