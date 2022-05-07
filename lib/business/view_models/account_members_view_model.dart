import '../models/account_member.dart';
import '../models/api_response.dart';
import '../services/cloudflare_service.dart';
import '../views/account_members_view.dart';

import '../../core/generics/loading_state.dart';


abstract class AccountMembersViewModel extends LoadingState<AccountMembersView> {
  ApiResponse<AccountMember, List<AccountMember>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  void _fetch() async {
    changeLoading();

    var members = await CloudflareService.instance.fetchAccountMembers(widget.accountId);

    setState(() {
      apiResponse = members;
    });

    changeLoading();
  }
}
