import 'package:flutter/material.dart';

import 'account_members_view.dart';
import 'account_website_list_view.dart';

import '../../models/account.dart';

class AccountMainView extends StatefulWidget {
  final Account account;

  const AccountMainView({Key? key, required this.account}) : super(key: key);

  @override
  State<AccountMainView> createState() => _AccountMainViewState();
}

class _AccountMainViewState extends State<AccountMainView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.account.name ?? ''),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Websites'),
            Tab(text: 'Members'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AccountWebsiteListView(accountId: widget.account.id ?? ''),
          AccountMembersView(accountId: widget.account.id ?? '')
        ],
      ),
    );
  }
}
