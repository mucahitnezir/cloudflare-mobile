class Account {
  String? id;
  String? name;
  AccountSettings? settings;

  Account({this.id, this.name, this.settings});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    settings = json['settings'] != null
        ? AccountSettings.fromJson(json['settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (settings != null) {
      data['settings'] = settings!.toJson();
    }
    return data;
  }
}

class AccountSettings {
  bool? enforceTwofactor;

  AccountSettings({this.enforceTwofactor});

  AccountSettings.fromJson(Map<String, dynamic> json) {
    enforceTwofactor = json['enforce_twofactor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['enforce_twofactor'] = enforceTwofactor;
    return data;
  }
}
