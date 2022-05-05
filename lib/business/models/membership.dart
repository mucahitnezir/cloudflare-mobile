import 'account.dart';

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

class Permissions {
  Permission? access;
  Permission? analytics;
  Permission? app;
  Permission? auditlogs;
  Permission? billing;
  Permission? cachePurge;
  Permission? dnsRecords;
  Permission? healthchecks;
  Permission? lb;
  Permission? legal;
  Permission? logs;
  Permission? member;
  Permission? organization;
  Permission? ssl;
  Permission? stream;
  Permission? subscription;
  TeamPermission? teams;
  Permission? waf;
  Permission? waitingroom;
  Permission? webhooks;
  Permission? worker;
  Permission? zaraz;
  Permission? zone;
  Permission? zoneSettings;

  Permissions(
      {this.access,
        this.analytics,
        this.app,
        this.auditlogs,
        this.billing,
        this.cachePurge,
        this.dnsRecords,
        this.healthchecks,
        this.lb,
        this.legal,
        this.logs,
        this.member,
        this.organization,
        this.ssl,
        this.stream,
        this.subscription,
        this.teams,
        this.waf,
        this.waitingroom,
        this.webhooks,
        this.worker,
        this.zaraz,
        this.zone,
        this.zoneSettings});

  Permissions.fromJson(Map<String, dynamic> json) {
    access =
    json['access'] != null ? Permission.fromJson(json['access']) : null;
    analytics = json['analytics'] != null
        ? Permission.fromJson(json['analytics'])
        : null;
    app = json['app'] != null ? Permission.fromJson(json['app']) : null;
    auditlogs = json['auditlogs'] != null
        ? Permission.fromJson(json['auditlogs'])
        : null;
    billing =
    json['billing'] != null ? Permission.fromJson(json['billing']) : null;
    cachePurge = json['cache_purge'] != null
        ? Permission.fromJson(json['cache_purge'])
        : null;
    dnsRecords = json['dns_records'] != null
        ? Permission.fromJson(json['dns_records'])
        : null;
    healthchecks = json['healthchecks'] != null
        ? Permission.fromJson(json['healthchecks'])
        : null;
    lb = json['lb'] != null ? Permission.fromJson(json['lb']) : null;
    legal = json['legal'] != null ? Permission.fromJson(json['legal']) : null;
    logs = json['logs'] != null ? Permission.fromJson(json['logs']) : null;
    member =
    json['member'] != null ? Permission.fromJson(json['member']) : null;
    organization = json['organization'] != null
        ? Permission.fromJson(json['organization'])
        : null;
    ssl = json['ssl'] != null ? Permission.fromJson(json['ssl']) : null;
    stream =
    json['stream'] != null ? Permission.fromJson(json['stream']) : null;
    subscription = json['subscription'] != null
        ? Permission.fromJson(json['subscription'])
        : null;
    teams = json['teams'] != null ? TeamPermission.fromJson(json['teams']) : null;
    waf = json['waf'] != null ? Permission.fromJson(json['waf']) : null;
    waitingroom = json['waitingroom'] != null
        ? Permission.fromJson(json['waitingroom'])
        : null;
    webhooks =
    json['webhooks'] != null ? Permission.fromJson(json['webhooks']) : null;
    worker =
    json['worker'] != null ? Permission.fromJson(json['worker']) : null;
    zaraz = json['zaraz'] != null ? Permission.fromJson(json['zaraz']) : null;
    zone = json['zone'] != null ? Permission.fromJson(json['zone']) : null;
    zoneSettings = json['zone_settings'] != null
        ? Permission.fromJson(json['zone_settings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (access != null) {
      data['access'] = access!.toJson();
    }
    if (analytics != null) {
      data['analytics'] = analytics!.toJson();
    }
    if (app != null) {
      data['app'] = app!.toJson();
    }
    if (auditlogs != null) {
      data['auditlogs'] = auditlogs!.toJson();
    }
    if (billing != null) {
      data['billing'] = billing!.toJson();
    }
    if (cachePurge != null) {
      data['cache_purge'] = cachePurge!.toJson();
    }
    if (dnsRecords != null) {
      data['dns_records'] = dnsRecords!.toJson();
    }
    if (healthchecks != null) {
      data['healthchecks'] = healthchecks!.toJson();
    }
    if (lb != null) {
      data['lb'] = lb!.toJson();
    }
    if (legal != null) {
      data['legal'] = legal!.toJson();
    }
    if (logs != null) {
      data['logs'] = logs!.toJson();
    }
    if (member != null) {
      data['member'] = member!.toJson();
    }
    if (organization != null) {
      data['organization'] = organization!.toJson();
    }
    if (ssl != null) {
      data['ssl'] = ssl!.toJson();
    }
    if (stream != null) {
      data['stream'] = stream!.toJson();
    }
    if (subscription != null) {
      data['subscription'] = subscription!.toJson();
    }
    if (teams != null) {
      data['teams'] = teams!.toJson();
    }
    if (waf != null) {
      data['waf'] = waf!.toJson();
    }
    if (waitingroom != null) {
      data['waitingroom'] = waitingroom!.toJson();
    }
    if (webhooks != null) {
      data['webhooks'] = webhooks!.toJson();
    }
    if (worker != null) {
      data['worker'] = worker!.toJson();
    }
    if (zaraz != null) {
      data['zaraz'] = zaraz!.toJson();
    }
    if (zone != null) {
      data['zone'] = zone!.toJson();
    }
    if (zoneSettings != null) {
      data['zone_settings'] = zoneSettings!.toJson();
    }
    return data;
  }
}

class Permission {
  bool? read;
  bool? edit;

  Permission({this.read, this.edit});

  Permission.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    edit = json['edit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['read'] = read;
    data['edit'] = edit;
    return data;
  }
}

class TeamPermission {
  bool? read;
  bool? edit;
  bool? report;

  TeamPermission({this.read, this.edit, this.report});

  TeamPermission.fromJson(Map<String, dynamic> json) {
    read = json['read'];
    edit = json['edit'];
    report = json['report'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['read'] = read;
    data['edit'] = edit;
    data['report'] = report;
    return data;
  }
}
