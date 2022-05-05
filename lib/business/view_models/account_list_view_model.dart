import 'package:flutter/material.dart';

import '../models/membership.dart';
import '../services/cloudflare_service.dart';
import '../views/account_list_view.dart';

abstract class AccountListViewModel extends State<AccountListView> {
  List<Membership>? memberships;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    var membershipList = await CloudflareService.instance.fetchMemberships();

    setState(() {
      memberships = membershipList;
    });
  }
}
