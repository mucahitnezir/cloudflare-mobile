import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/zone.dart';

class WebsiteListItem extends StatelessWidget {
  final Zone zone;

  const WebsiteListItem({Key? key, required this.zone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          title: Text(zone.name ?? ''),
          subtitle: Text('${zone.account?.name} - ${zone.plan?.name}'),
          // leading: const Icon(Icons.arrow_back),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: redirect to account page
          },
        )
    );
  }
}
