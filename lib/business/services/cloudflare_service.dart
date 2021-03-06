import 'package:dio/dio.dart';

import '../dto/pagination_dto.dart';
import '../dto/zone_settings_identifier_dto.dart';

import '../models/api_response.dart';
import '../models/account_member.dart';
import '../models/membership.dart';
import '../models/zone.dart';
import '../models/dns_record.dart';
import '../models/zone_settings.dart';

class CloudflareService {
  CloudflareService._init() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.cloudflare.com/client/v4',
    ));
  }

  late final Dio _dio;

  static final CloudflareService _instance = CloudflareService._init();

  static CloudflareService get instance => _instance;

  void setToken(String token) {
    _dio.options = _dio.options.copyWith(
      headers: {"Authorization": "Bearer $token"},
    );
  }

  Future<ApiResponse<Membership, List<Membership>>> fetchMemberships() async {
    try {
      final response = await _dio.get('/memberships');
      final jsonBody = response.data;
      return ApiResponse<Membership, List<Membership>>.fromJson(jsonBody, (result) => Membership.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<Membership, List<Membership>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<Zone, List<Zone>>> fetchZones(PaginationDto paginationDto) async {
    try {
      // Prepare query parameters
      Map<String, dynamic> queryParams = paginationDto.toJson();

      final response = await _dio.get('/zones?page=1', queryParameters: queryParams);
      final jsonBody = response.data;
      return ApiResponse<Zone, List<Zone>>.fromJson(jsonBody, (result) => Zone.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<Zone, List<Zone>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<Zone, List<Zone>>> fetchAccountZones(String accountId, PaginationDto paginationDto) async {
    try {
      // Prepare query parameters
      Map<String, dynamic> queryParams = {'account.id': accountId};
      queryParams.addAll(paginationDto.toJson());

      final response = await _dio.get('/zones', queryParameters: queryParams);
      final jsonBody = response.data;
      return ApiResponse<Zone, List<Zone>>.fromJson(jsonBody, (result) => Zone.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<Zone, List<Zone>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<ZoneSettings, ZoneSettings>> fetchZoneSettings(ZoneSettingsIdentifierDto identifierDto) async {
    try {
      // Prepare query parameters
      final response = await _dio.get('/zones/${identifierDto.zoneId}/settings/${identifierDto.identifier}');
      final jsonBody = response.data;
      return ApiResponse<ZoneSettings, ZoneSettings>.fromJson(jsonBody, (result) => ZoneSettings.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<ZoneSettings, ZoneSettings>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<AccountMember, List<AccountMember>>> fetchAccountMembers(String accountId, PaginationDto paginationDto) async {
    try {
      // Prepare query parameters
      Map<String, dynamic> queryParams = paginationDto.toJson();

      final response = await _dio.get('/accounts/$accountId/members', queryParameters: queryParams);
      final jsonBody = response.data;
      return ApiResponse<AccountMember, List<AccountMember>>.fromJson(jsonBody, (result) => AccountMember.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<AccountMember, List<AccountMember>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<DnsRecord, List<DnsRecord>>> fetchDnsRecords(String zoneId) async {
    try {
      final response = await _dio.get('/zones/$zoneId/dns_records');
      final jsonBody = response.data;
      return ApiResponse<DnsRecord, List<DnsRecord>>.fromJson(jsonBody, (result) => DnsRecord.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<DnsRecord, List<DnsRecord>>.fromError(err.response?.data);
    }
  }
}
