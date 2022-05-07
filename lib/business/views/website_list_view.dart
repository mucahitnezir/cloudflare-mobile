import 'package:flutter/material.dart';

import '../view_models/website_list_view_model.dart';

class WebsiteListView extends StatefulWidget {
  const WebsiteListView({Key? key}) : super(key: key);

  @override
  State<WebsiteListView> createState() => _WebsiteListViewState();
}

class _WebsiteListViewState extends WebsiteListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Websites'),
      ),
      body: apiResponse == null ? const Text('Loading') : ListView.builder(
        itemCount: apiResponse?.result?.length,
        itemBuilder: (BuildContext context, int index) {
          var zone = apiResponse?.result?[index];

          return Card(
            child: ListTile(
              title: Text(zone?.name ?? ''),
              subtitle: Text(zone?.account?.name ?? ''),
              // leading: const Icon(Icons.arrow_back),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: redirect to account page
              },
            )
          );
        },
      ),
    );
  }
}
