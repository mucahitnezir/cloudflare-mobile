import 'package:cloudflare_mobile/business/dto/pagination_dto.dart';
import 'package:cloudflare_mobile/widgets/pagination.dart';
import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/view_models/account_website_list_view_model.dart';
import 'package:cloudflare_mobile/widgets/error_viewer.dart';
import 'package:cloudflare_mobile/widgets/loading.dart';
import 'package:cloudflare_mobile/widgets/website_list_item.dart';

class AccountWebsiteListView extends StatefulWidget {
  final String accountId;

  const AccountWebsiteListView({Key? key, required this.accountId})
      : super(key: key);

  @override
  State<AccountWebsiteListView> createState() => _AccountWebsiteListViewState();
}

class _AccountWebsiteListViewState extends AccountWebsiteListViewModel {
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
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: apiResponse?.result?.length,
            itemBuilder: (BuildContext context, int index) {
              var zone = apiResponse?.result?[index];

              return WebsiteListItem(zone: zone!);
            },
          ),
        ),
        _buildPagination,
      ],
    );
  }

  Widget get _buildPagination {
    return Pagination(
      label: 'websites',
      resultInfo: apiResponse!.resultInfo!,
      prevCallback: (PaginationDto prevPaginationDto) {
        paginationDto = prevPaginationDto;
        fetch();
      },
      nextCallback: (PaginationDto nextPaginationDto) {
        paginationDto = nextPaginationDto;
        fetch();
      },
    );
  }
}
