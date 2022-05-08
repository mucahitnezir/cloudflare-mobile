import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/zone.dart';

class WebsiteOverviewView extends StatefulWidget {
  final Zone zone;

  const WebsiteOverviewView({Key? key, required this.zone}) : super(key: key);

  @override
  State<WebsiteOverviewView> createState() => _WebsiteOverviewViewState();
}

class _WebsiteOverviewViewState extends State<WebsiteOverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Domain', widget.zone.name),
          _buildListItem('Plan', widget.zone.plan?.name),
          _buildListItem('Account', widget.zone.account?.name),
          _buildListItem('Status', widget.zone.status),
          _buildListItem('Development Mode', widget.zone.developmentMode!.toString()),
          _buildListItem('Paused', widget.zone.paused! ? 'Paused' : 'Not Paused'),
          _buildListItem('Name Servers', widget.zone.nameServers!.join('\n')),
          _buildListItem('Page Rule Quota', widget.zone.meta?.pageRuleQuota.toString()),
          _buildListItem('Created On', widget.zone.createdOn),
          _buildListItem('Activated On', widget.zone.activatedOn),
          _buildListItem('Zone Id', widget.zone.id),
          _buildListItem('Account Id', widget.zone.account?.id),
        ],
      ),
    );
  }

  ListTile _buildListItem(String label, String? value) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value ?? '-'),
    );
  }
}
