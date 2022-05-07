import 'base_entity.dart';

class ApiResponse<EntityType extends BaseEntity, ResponseType> {
  bool success;
  List<Error> errors;
  ResponseType? result;
  ResultInfo? resultInfo;

  ApiResponse({required this.success, required this.errors, this.result, this.resultInfo});

  factory ApiResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var jsonResult = json['result'];

    ResponseType? result;
    if (jsonResult != null) {
      bool isResultList = json['result'] is List;

      result = isResultList
          ? List.from(json['result']).map<EntityType>((jsonData) => create(jsonData)).toList()
          : create(json['result']);
    }

    return ApiResponse<EntityType, ResponseType>(
      success: json['success'],
      errors: List.from(json['errors']).map((e) => Error.fromJson(e)).toList(),
      result: result,
      resultInfo: json['result_info'] != null ? ResultInfo.fromJson(json['result_info']) : null
    );
  }

  factory ApiResponse.fromError(Map<String, dynamic> json) {
    return ApiResponse<EntityType, ResponseType>(
      success: json['success'],
      errors: List.from(json['errors']).map((e) => Error.fromJson(e)).toList(),
    );
  }
}

class Error {
  String code;
  String message;

  Error({required this.code, required this.message});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(code: json['code'], message: json['message']);
  }
}

class ResultInfo {
  int page;
  int perPage;
  int count;
  int totalCount;

  ResultInfo({required this.page, required this.perPage, required this.count, required this.totalCount});

  factory ResultInfo.fromJson(Map<String, dynamic> json) {
    return ResultInfo(
      page: json['page'],
      perPage: json['per_page'],
      count: json['count'],
      totalCount: json['total_count'],
    );
  }
}
