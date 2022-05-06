import 'permission.dart';

class Role {
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
        ? new Permissions.fromJson(json['permissions'])
        : null;
  }

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
