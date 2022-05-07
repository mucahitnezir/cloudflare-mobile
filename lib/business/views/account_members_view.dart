import 'package:flutter/material.dart';

import '../view_models/account_members_view_model.dart';

class AccountMembersView extends StatefulWidget {
  final String accountId;

  const AccountMembersView({Key? key, required this.accountId}) : super(key: key);

  @override
  State<AccountMembersView> createState() => _AccountMembersViewState();
}

class _AccountMembersViewState extends AccountMembersViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: apiResponse == null ? const Text('Loading') : ListView.builder(
        itemCount: apiResponse?.result?.length,
        itemBuilder: (BuildContext context, int index) {
          var data = apiResponse?.result?[index];

          return Card(
              child: ListTile(
                title: Text(data?.user?.email ?? ''),
                subtitle: Text('${data?.roles?[0].name} · ${data?.status}'),
                // trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: show other details
                },
              )
          );
        },
      ),
    );
  }
}
