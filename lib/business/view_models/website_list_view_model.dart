import 'package:flutter/material.dart';

import '../models/zone.dart';
import '../services/cloudflare_service.dart';
import '../views/website_list_view.dart';

abstract class WebsiteListViewModel extends State<WebsiteListView> {
  List<Zone>? zones;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    var zoneList = await CloudflareService.instance.fetchZones();

    setState(() {
      zones = zoneList;
    });
  }
}
