import 'package:cloudflare_mobile/business/dto/pagination_dto.dart';
import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/api_response.dart';

class Pagination extends StatelessWidget {
  final ResultInfo resultInfo;
  final void Function(PaginationDto paginationDto) prevCallback;
  final void Function(PaginationDto paginationDto) nextCallback;
  final String label;

  const Pagination({
    Key? key,
    required this.resultInfo,
    required this.prevCallback,
    required this.nextCallback,
    this.label = 'entities',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: resultInfo.hasPreviousPage
              ? () {
                  var dto = resultInfo.previousPaginationDto!;
                  prevCallback(dto);
                }
              : null,
        ),
        Text(resultInfo.paginationText(label)),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: resultInfo.hasNextPage
              ? () {
                  var dto = resultInfo.nextPaginationDto!;
                  nextCallback(dto);
                }
              : null,
        ),
      ],
    );
  }
}
