import 'package:flutter/material.dart';

class CustomTableRowAssetImageWidget extends StatelessWidget {
  final String string;
  const CustomTableRowAssetImageWidget({
    super.key,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          string,
          scale: 9.9,
        )
      ],
    );
  }
}
