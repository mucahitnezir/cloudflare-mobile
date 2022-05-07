import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:cloudflare_mobile/business/models/api_response.dart';

class ErrorViewer extends StatelessWidget {
  final List<ApiError> errors;

  const ErrorViewer({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var errorMessage = errors.isNotEmpty
        ? errors[0].message
        : 'An error occurred';

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: Lottie.network('https://assets6.lottiefiles.com/private_files/lf30_jq4i7W.json'),
          ),
          Text(
            errorMessage,
            style: const TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
