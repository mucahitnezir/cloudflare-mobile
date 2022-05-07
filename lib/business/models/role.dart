import 'base_entity.dart';
import 'permission.dart';

class Role extends BaseEntity {
  String? id;
  String? name;
  String? description;
  Permissions? permissions;

  Role({this.id, this.name, this.description, this.permissions});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (permissions != null) {
      data['permissions'] = permissions!.toJson();
    }
    return data;
  }
}
