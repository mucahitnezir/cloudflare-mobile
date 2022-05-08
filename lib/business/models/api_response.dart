import 'base_entity.dart';

import '../dto/pagination_dto.dart';

class ApiResponse<EntityType extends BaseEntity, ResponseType> {
  bool success;
  List<ApiError> errors;
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
      errors: List.from(json['errors']).map((e) => ApiError.fromJson(e)).toList(),
      result: result,
      resultInfo: json['result_info'] != null ? ResultInfo.fromJson(json['result_info']) : null
    );
  }

  factory ApiResponse.fromError(Map<String, dynamic> json) {
    return ApiResponse<EntityType, ResponseType>(
      success: json['success'],
      errors: List.from(json['errors']).map((e) => ApiError.fromJson(e)).toList(),
    );
  }
}

class ApiError {
  int code;
  String message;

  ApiError({required this.code, required this.message});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(code: json['code'], message: json['message']);
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

  String paginationText(String label) {
    var startItem = (page - 1) * perPage + 1;
    var lastItem = startItem + count - 1;
    return '$startItem to $lastItem of $totalCount $label';
  }

  int get maxPage {
    return (totalCount / perPage).ceil();
  }

  bool get hasPreviousPage {
    return page > 1;
  }

  PaginationDto? get previousPaginationDto {
    if (!hasPreviousPage) {
      return null;
    }

    return PaginationDto(
      page: page - 1,
      perPage: perPage
    );
  }

  bool get hasNextPage {
    return maxPage > 1 && page < maxPage;
  }

  PaginationDto? get nextPaginationDto {
    if (!hasNextPage) {
      return null;
    }

    return PaginationDto(
        page: page + 1,
        perPage: perPage
    );
  }
}
