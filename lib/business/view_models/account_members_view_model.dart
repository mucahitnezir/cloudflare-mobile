import 'package:cloudflare_mobile/business/dto/pagination_dto.dart';

import '../models/account_member.dart';
import '../models/api_response.dart';
import '../services/cloudflare_service.dart';
import '../views/account_members_view.dart';

import '../../core/generics/loading_state.dart';


abstract class AccountMembersViewModel extends LoadingState<AccountMembersView> {
  PaginationDto paginationDto = PaginationDto();
  ApiResponse<AccountMember, List<AccountMember>>? apiResponse;

  @override
  void initState() {
    super.initState();

    fetch();
  }

  void fetch() async {
    changeLoading();

    var members = await CloudflareService.instance.fetchAccountMembers(widget.accountId, paginationDto);

    setState(() {
      apiResponse = members;
    });

    changeLoading();
  }
}
