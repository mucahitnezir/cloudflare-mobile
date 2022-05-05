class Zone {
  String? id;
  String? name;
  String? status;
  bool? paused;
  String? type;
  int? developmentMode;
  List<String>? nameServers;
  List<String>? originalNameServers;
  String? originalRegistrar;
  String? modifiedOn;
  String? createdOn;
  String? activatedOn;
  ZoneMeta? meta;
  ZoneOwner? owner;
  ZoneAccount? account;
  List<String>? permissions;
  ZonePlan? plan;

  Zone(
      {this.id,
        this.name,
        this.status,
        this.paused,
        this.type,
        this.developmentMode,
        this.nameServers,
        this.originalNameServers,
        this.originalRegistrar,
        this.modifiedOn,
        this.createdOn,
        this.activatedOn,
        this.meta,
        this.owner,
        this.account,
        this.permissions,
        this.plan});

  Zone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    paused = json['paused'];
    type = json['type'];
    developmentMode = json['development_mode'];
    nameServers = json['name_servers'].cast<String>();
    // originalNameServers = json['original_name_servers'].cast<List<String>>();
    originalRegistrar = json['original_registrar'];
    modifiedOn = json['modified_on'];
    createdOn = json['created_on'];
    activatedOn = json['activated_on'];
    meta = json['meta'] != null ? ZoneMeta.fromJson(json['meta']) : null;
    owner = json['owner'] != null ? ZoneOwner.fromJson(json['owner']) : null;
    account =
    json['account'] != null ? ZoneAccount.fromJson(json['account']) : null;
    permissions = json['permissions'].cast<String>();
    plan = json['plan'] != null ? ZonePlan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['paused'] = paused;
    data['type'] = type;
    data['development_mode'] = developmentMode;
    data['name_servers'] = nameServers;
    data['original_name_servers'] = originalNameServers;
    data['original_registrar'] = originalRegistrar;
    data['modified_on'] = modifiedOn;
    data['created_on'] = createdOn;
    data['activated_on'] = activatedOn;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (account != null) {
      data['account'] = account!.toJson();
    }
    data['permissions'] = permissions;
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class ZoneMeta {
  int? step;
  int? customCertificateQuota;
  int? pageRuleQuota;
  bool? phishingDetected;
  bool? multipleRailgunsAllowed;

  ZoneMeta(
      {this.step,
        this.customCertificateQuota,
        this.pageRuleQuota,
        this.phishingDetected,
        this.multipleRailgunsAllowed});

  ZoneMeta.fromJson(Map<String, dynamic> json) {
    step = json['step'];
    customCertificateQuota = json['custom_certificate_quota'];
    pageRuleQuota = json['page_rule_quota'];
    phishingDetected = json['phishing_detected'];
    multipleRailgunsAllowed = json['multiple_railguns_allowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['step'] = step;
    data['custom_certificate_quota'] = customCertificateQuota;
    data['page_rule_quota'] = pageRuleQuota;
    data['phishing_detected'] = phishingDetected;
    data['multiple_railguns_allowed'] = multipleRailgunsAllowed;
    return data;
  }
}

class ZoneOwner {
  String? id;
  String? type;
  String? email;

  ZoneOwner({this.id, this.type, this.email});

  ZoneOwner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['email'] = email;
    return data;
  }
}

class ZoneAccount {
  String? id;
  String? name;

  ZoneAccount({this.id, this.name});

  ZoneAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ZonePlan {
  String? id;
  String? name;
  int? price;
  String? currency;
  String? frequency;
  bool? isSubscribed;
  bool? canSubscribe;
  String? legacyId;
  bool? legacyDiscount;
  bool? externallyManaged;

  ZonePlan(
      {this.id,
        this.name,
        this.price,
        this.currency,
        this.frequency,
        this.isSubscribed,
        this.canSubscribe,
        this.legacyId,
        this.legacyDiscount,
        this.externallyManaged});

  ZonePlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    currency = json['currency'];
    frequency = json['frequency'];
    isSubscribed = json['is_subscribed'];
    canSubscribe = json['can_subscribe'];
    legacyId = json['legacy_id'];
    legacyDiscount = json['legacy_discount'];
    externallyManaged = json['externally_managed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['currency'] = currency;
    data['frequency'] = frequency;
    data['is_subscribed'] = isSubscribed;
    data['can_subscribe'] = canSubscribe;
    data['legacy_id'] = legacyId;
    data['legacy_discount'] = legacyDiscount;
    data['externally_managed'] = externallyManaged;
    return data;
  }
}
