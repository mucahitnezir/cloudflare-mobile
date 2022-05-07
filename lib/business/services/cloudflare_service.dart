import 'package:dio/dio.dart';

import '../models/api_response.dart';
import '../models/account_member.dart';
import '../models/membership.dart';
import '../models/zone.dart';

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

  Future<ApiResponse<Zone, List<Zone>>> fetchZones() async {
    try {
      final response = await _dio.get('/zones');
      final jsonBody = response.data;
      return ApiResponse<Zone, List<Zone>>.fromJson(jsonBody, (result) => Zone.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<Zone, List<Zone>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<Zone, List<Zone>>> fetchAccountZones(String accountId) async {
    try {
      final response = await _dio.get('/zones', queryParameters: {'account.id': accountId});
      final jsonBody = response.data;
      return ApiResponse<Zone, List<Zone>>.fromJson(jsonBody, (result) => Zone.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<Zone, List<Zone>>.fromError(err.response?.data);
    }
  }

  Future<ApiResponse<AccountMember, List<AccountMember>>> fetchAccountMembers(String accountId) async {
    try {
      final response = await _dio.get('/accounts/$accountId/members');
      final jsonBody = response.data;
      return ApiResponse<AccountMember, List<AccountMember>>.fromJson(jsonBody, (result) => AccountMember.fromJson(result));
    } on DioError catch (err) {
      return ApiResponse<AccountMember, List<AccountMember>>.fromError(err.response?.data);
    }
  }
}
