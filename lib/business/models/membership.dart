import 'account.dart';
import 'permission.dart';

class Membership {
  String? id;
  String? status;
  Permissions? permissions;
  List<String>? roles;
  Account? account;

  Membership(
      {this.id, this.status, this.permissions, this.roles, this.account});

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
    roles = json['roles'].cast<String>();
    account =
    json['account'] != null ? Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    if (permissions != null) {
      data['permissions'] = permissions!.toJson();
    }
    data['roles'] = roles;
    if (account != null) {
      data['account'] = account!.toJson();
    }
    return data;
  }
}
