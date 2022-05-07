import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/api_response.dart';

class ErrorViewer extends StatelessWidget {
  final List<ApiError> errors;

  const ErrorViewer({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var errorMessage = errors.isNotEmpty
        ? errors[0].message
        : 'An error occurred';

    return Center(
      child: Text(errorMessage),
    );
  }
}
