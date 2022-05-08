import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/dto/pagination_dto.dart';
import 'package:cloudflare_mobile/widgets/pagination.dart';
import 'package:cloudflare_mobile/widgets/website_list_item.dart';
import 'package:cloudflare_mobile/widgets/error_viewer.dart';
import 'package:cloudflare_mobile/widgets/loading.dart';

import '../../view_models/website_list_view_model.dart';

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
        centerTitle: false,
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
        _buildPagination
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
