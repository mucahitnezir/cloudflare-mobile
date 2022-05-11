import 'package:cloudflare_mobile/business/models/dns_record.dart';
import 'package:cloudflare_mobile/core/generics/loading_state.dart';

import '../models/api_response.dart';
import '../services/cloudflare_service.dart';
import '../views/website/website_dns_view.dart';

abstract class WebsiteDnsViewModel extends LoadingState<WebsiteDnsView> {
  ApiResponse<DnsRecord, List<DnsRecord>>? apiResponse;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();

    var dnsResponse = await CloudflareService.instance.fetchDnsRecords(widget.zone.id!);

    setState(() {
      apiResponse = dnsResponse;
    });

    changeLoading();
  }
}
