import 'base_entity.dart';

class ZoneSettings extends BaseEntity {
  String id;
  String value;
  bool editable;
  String? modifiedOn;

  ZoneSettings({
    required this.id,
    required this.value,
    required this.editable,
    this.modifiedOn,
  });

  factory ZoneSettings.fromJson(Map<String, dynamic> json) {
    return ZoneSettings(
      id: json['id'],
      value: json['value'],
      editable: json['editable'],
      modifiedOn: json['modified_on'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['editable'] = editable;
    data['modified_on'] = modifiedOn;
    return data;
  }
}
