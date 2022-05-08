import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/zone.dart';

import 'website_overview_view.dart';

class WebsiteMainView extends StatefulWidget {
  final Zone zone;

  const WebsiteMainView({Key? key, required this.zone}) : super(key: key);

  @override
  State<WebsiteMainView> createState() => _WebsiteMainViewState();
}

class _WebsiteMainViewState extends State<WebsiteMainView> with TickerProviderStateMixin {
  late final TabController _tabController;

  late final tabs = [
    {
      'title': 'Overview',
      'widget': WebsiteOverviewView(zone: widget.zone),
    },
    {
      'title': 'DNS',
      'widget': const Center(child: Text('DNS Page')),
    },
    {
      'title': 'Speed',
      'widget': const Center(child: Text('Speed Page')),
    },
    {
      'title': 'Caching',
      'widget': const Center(child: Text('Caching Page')),
    },
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.zone.name!),
        centerTitle: false,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabs.map((e) => Tab(text: e['title'].toString())).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map<Widget>((e) => e['widget'] as Widget).toList(),
      ),
    );
  }
}
