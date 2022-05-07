import 'package:cloudflare_mobile/core/generics/loading_state.dart';

import '../models/api_response.dart';
import '../models/zone.dart';
import '../services/cloudflare_service.dart';
import '../views/website_list_view.dart';

abstract class WebsiteListViewModel extends LoadingState<WebsiteListView> {
  ApiResponse<Zone, List<Zone>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();

    var zoneList = await CloudflareService.instance.fetchZones();

    setState(() {
      apiResponse = zoneList;
    });

    changeLoading();
  }
}
