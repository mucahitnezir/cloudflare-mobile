import 'package:cloudflare_mobile/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../core/constants/navigation_constants.dart';
import '../view_models/account_list_view_model.dart';

class AccountListView extends StatefulWidget {
  const AccountListView({Key? key}) : super(key: key);

  @override
  State<AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends AccountListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: apiResponse == null ? const Text('Loading') : ListView.builder(
        itemCount: apiResponse?.result?.length,
        itemBuilder: (BuildContext context, int index) {
          var data = apiResponse?.result?[index];

          return Card(
            child: ListTile(
              title: Text(data?.account?.name ?? ''),
              // leading: const Icon(Icons.arrow_back),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                NavigationService.instance.navigateToPage(
                  path: NavigationConstants.organizationView,
                  data: data?.account
                );
                // TODO: redirect to account page
              },
            )
          );
        },
      ),
    );
  }
}
