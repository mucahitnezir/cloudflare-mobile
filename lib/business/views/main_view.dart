import 'package:flutter/material.dart';

import './account_list_view.dart';
import './website_list_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: 'Accounts'),
        BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Websites'),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  Widget get _buildBody {
    if (_currentIndex == 1) {
      return const WebsiteListView();
    }
    return const AccountListView();
  }
}
