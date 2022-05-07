import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_x62chJ.json', width: 250, height: 250),
    );
  }
}
