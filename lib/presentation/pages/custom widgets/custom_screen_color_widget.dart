import 'package:flutter/material.dart';

class CustomScreenColorWidget extends StatelessWidget {
  final AlignmentDirectional alignmentDirectional;
  final double? height;
  final double? width;
  final Decoration? decoration;
  const CustomScreenColorWidget(
      {super.key,
      required this.alignmentDirectional,
      this.height,
      this.width,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentDirectional,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
      ),
    );
  }
}
