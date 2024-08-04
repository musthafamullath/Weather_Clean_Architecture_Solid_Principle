import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomSpinkitWidget extends StatelessWidget {
  const CustomSpinkitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
        color: Colors.white.withOpacity(0.25),
        size: 50,
      ),
    );
  }
}
