import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/widgets/error_viewer.dart';
import 'package:cloudflare_mobile/widgets/loading.dart';

import '../view_models/account_members_view_model.dart';

class AccountMembersView extends StatefulWidget {
  final String accountId;

  const AccountMembersView({Key? key, required this.accountId})
      : super(key: key);

  @override
  State<AccountMembersView> createState() => _AccountMembersViewState();
}

class _AccountMembersViewState extends AccountMembersViewModel {
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
        var data = apiResponse?.result?[index];

        return Card(
            child: ListTile(
          title: Text(data?.user?.email ?? ''),
          subtitle: Text('${data?.roles?[0].name} · ${data?.status}'),
          // trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: show other details
          },
        ));
      },
    );
  }
}
