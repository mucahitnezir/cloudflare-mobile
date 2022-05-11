import 'package:flutter/material.dart';

import '../../models/zone.dart';
import '../../view_models/website_dns_view_model.dart';

import '../../../widgets/error_viewer.dart';
import '../../../widgets/loading.dart';

class WebsiteDnsView extends StatefulWidget {
  final Zone zone;

  const WebsiteDnsView({Key? key, required this.zone}) : super(key: key);

  @override
  State<WebsiteDnsView> createState() => _WebsiteDnsViewState();
}

class _WebsiteDnsViewState extends WebsiteDnsViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? const Loading() : _buildBodyContent,
    );
  }

  Widget get _buildBodyContent {
    if (apiResponse == null) {
      return Container();
    }

    return apiResponse!.success
        ? _buildContent
        : ErrorViewer(errors: apiResponse!.errors);
  }

  Widget get _buildContent {
    return ListView.builder(
      itemCount: apiResponse?.result?.length,
      itemBuilder: (BuildContext context, int index) {
        var dnsRecord = apiResponse?.result?[index];

        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                      fontSize: 14.0
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: dnsRecord?.type,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(49, 49, 49, 1),
                      ),
                    ),
                    TextSpan(
                      text: ' (${dnsRecord?.statusText} | ${dnsRecord?.ttlText})',
                      style: const TextStyle(
                        color: Color.fromRGBO(74, 74, 74, 1),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
          subtitle: Text(
            '\n${dnsRecord?.name}\n\n${dnsRecord?.content}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
