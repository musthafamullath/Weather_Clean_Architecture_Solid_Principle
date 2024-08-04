  import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/icons/1.png',scale: 2,);
      case >= 300 && < 400:
        return Image.asset('assets/icons/2.png',scale: 2,);
      case >= 500 && < 600:
        return Image.asset('assets/icons/3.png',scale: 2,);
      case >= 600 && < 700:
        return Image.asset('assets/icons/4.png',scale: 2,);
      case >= 701 && < 742:
        return Image.asset('assets/icons/9.png',scale: 2,);
      case >= 751 && < 781:
        return Image.asset('assets/icons/5.png',scale: 2,);
      case == 800:
        return Image.asset('assets/icons/6.png',scale: 2,);
      case > 800 && <= 804:
        return Image.asset('assets/icons/8.png',scale: 2,);
      default:
        return Image.asset('assets/icons/7.png',scale: 2,);
    }
  }