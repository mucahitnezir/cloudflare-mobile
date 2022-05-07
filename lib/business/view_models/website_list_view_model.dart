import 'package:cloudflare_mobile/business/models/api_response.dart';
import 'package:flutter/material.dart';

import '../models/zone.dart';
import '../services/cloudflare_service.dart';
import '../views/website_list_view.dart';

abstract class WebsiteListViewModel extends State<WebsiteListView> {
  ApiResponse<Zone, List<Zone>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    var zoneList = await CloudflareService.instance.fetchZones();

    setState(() {
      apiResponse = zoneList;
    });
  }
}
