import 'base_entity.dart';
import 'role.dart';
import 'user.dart';

class AccountMember extends BaseEntity {
  String? id;
  User? user;
  String? status;
  List<Role>? roles;

  AccountMember({this.id, this.user, this.status, this.roles});

  AccountMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    status = json['status'];
    if (json['roles'] != null) {
      roles = <Role>[];
      json['roles'].forEach((v) {
        roles!.add(Role.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['status'] = status;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
