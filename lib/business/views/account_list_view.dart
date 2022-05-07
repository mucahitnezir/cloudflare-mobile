import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/core/constants/navigation_constants.dart';
import 'package:cloudflare_mobile/core/constants/enums/locale_keys.dart';
import 'package:cloudflare_mobile/core/init/cache/locale_manager.dart';
import 'package:cloudflare_mobile/core/init/navigation/navigation_service.dart';

import 'package:cloudflare_mobile/widgets/error_viewer.dart';
import 'package:cloudflare_mobile/widgets/loading.dart';

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
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              LocaleManager.instance.remove(LocaleKeys.cfApiToken);
              NavigationService.instance.navigateToPageClear(
                path: NavigationConstants.loginRoute,
              );
            },
          )
        ],
      ),
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
              title: Text(data?.account?.name ?? ''),
              // leading: const Icon(Icons.arrow_back),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                NavigationService.instance.navigateToPage(
                    path: NavigationConstants.organizationRoute,
                    data: data?.account
                );
                // TODO: redirect to account page
              },
            )
        );
      },
    );
  }
}
