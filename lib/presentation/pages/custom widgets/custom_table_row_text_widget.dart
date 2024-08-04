import 'package:flutter/material.dart';

class CustomTableRowTextWidget extends StatelessWidget {
  final String string;
  const CustomTableRowTextWidget({
    super.key,
    required this.string,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      string,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
