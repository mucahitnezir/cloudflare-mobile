import 'package:flutter/material.dart';

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
      body: memberships == null ? const Text('Loading') : ListView.builder(
        itemCount: memberships?.length,
        itemBuilder: (BuildContext context, int index) {
          var data = memberships?[index];

          return Card(
            child: ListTile(
              title: Text(data?.account?.name ?? ''),
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
