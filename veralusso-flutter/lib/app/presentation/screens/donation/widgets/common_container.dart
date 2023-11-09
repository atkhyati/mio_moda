import 'package:flutter/material.dart';

class CommonContainer extends StatelessWidget {
  final double? height;
  final String imageUrl;

  const CommonContainer({Key? key,required this.height, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageUrl);
  }
}
