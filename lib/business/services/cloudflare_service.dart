import 'dart:io';

import 'package:dio/dio.dart';

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

  Future<List<Membership>?> fetchMemberships() async {
    final response = await _dio.get('/memberships');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        List result = jsonBody['result'];
        return result.map((json) => Membership.fromJson(json)).toList();
      }
    }
    return null;
  }

  Future<List<Zone>?> fetchZones() async {
    final response = await _dio.get('/zones');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        List result = jsonBody['result'];
        return result.map((json) => Zone.fromJson(json)).toList();
      }
    }
    return null;
  }

  Future<List<AccountMember>?> fetchAccountMembers(String organizationId) async {
    final response = await _dio.get('/accounts/$organizationId/members');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        List result = jsonBody['result'];
        return result.map((json) => AccountMember.fromJson(json)).toList();
      }
    }
    return null;
  }
}
