import 'package:cloudflare_mobile/business/models/account_member.dart';
import 'package:cloudflare_mobile/business/models/api_response.dart';
import 'package:cloudflare_mobile/business/services/cloudflare_service.dart';
import 'package:flutter/material.dart';

import '../views/account_members_view.dart';

abstract class AccountMembersViewModel extends State<AccountMembersView> {
  ApiResponse<AccountMember, List<AccountMember>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() async {
    var members = await CloudflareService.instance.fetchAccountMembers(widget.accountId);

    setState(() {
      apiResponse = members;
    });
  }
}
