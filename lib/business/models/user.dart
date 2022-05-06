class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? twoFactorAuthenticationEnabled;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.twoFactorAuthenticationEnabled});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    twoFactorAuthenticationEnabled = json['two_factor_authentication_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['two_factor_authentication_enabled'] = twoFactorAuthenticationEnabled;
    return data;
  }
}
