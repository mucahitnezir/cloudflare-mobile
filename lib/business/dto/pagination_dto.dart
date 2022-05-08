class PaginationDto {
  int page;
  int perPage;
  String? order;
  String? direction;

  PaginationDto({this.page = 1, this.perPage = 20, this.order, this.direction});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    if (order != null) {
      data['order'] = order;
    }
    if (direction != null) {
      data['direction'] = direction;
    }
    return data;
  }
}
