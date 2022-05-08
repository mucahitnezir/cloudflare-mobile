import 'package:flutter/material.dart';

import 'package:cloudflare_mobile/business/models/zone.dart';

import 'package:cloudflare_mobile/core/constants/navigation_constants.dart';
import 'package:cloudflare_mobile/core/init/navigation/navigation_service.dart';

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
            NavigationService.instance.navigateToPage(
              path: NavigationConstants.websiteRoute,
              data: zone,
            );
          },
        )
    );
  }
}
