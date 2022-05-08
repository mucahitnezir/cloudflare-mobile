import 'package:cloudflare_mobile/business/dto/pagination_dto.dart';
import 'package:cloudflare_mobile/core/generics/loading_state.dart';

import '../models/api_response.dart';
import '../models/zone.dart';
import '../services/cloudflare_service.dart';
import '../views/main/website_list_view.dart';

abstract class WebsiteListViewModel extends LoadingState<WebsiteListView> {
  PaginationDto paginationDto = PaginationDto();
  ApiResponse<Zone, List<Zone>>? apiResponse;

  @override
  void initState() {
    super.initState();

    fetch();
  }

  Future<void> fetch() async {
    changeLoading();

    var zoneList = await CloudflareService.instance.fetchZones(paginationDto);

    setState(() {
      apiResponse = zoneList;
    });

    changeLoading();
  }
}
