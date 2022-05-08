import 'package:cloudflare_mobile/core/generics/loading_state.dart';

import '../models/api_response.dart';
import '../models/membership.dart';
import '../services/cloudflare_service.dart';
import '../views/main/account_list_view.dart';

abstract class AccountListViewModel extends LoadingState<AccountListView> {
  ApiResponse<Membership, List<Membership>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();

    var membershipList = await CloudflareService.instance.fetchMemberships();

    setState(() {
      apiResponse = membershipList;
    });

    changeLoading();
  }
}
