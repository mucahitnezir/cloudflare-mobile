import 'base_entity.dart';

class DnsRecord extends BaseEntity {
  String? id;
  String? zoneId;
  String? zoneName;
  String? name;
  String? type;
  String? content;
  bool? proxiable;
  bool? proxied;
  int? ttl;
  bool? locked;
  DnsRecordMeta? meta;
  String? createdOn;
  String? modifiedOn;

  String get statusText => proxied! ? 'Proxied' : 'DNS only';
  String get ttlText => proxied! || ttl! == 1 ? 'auto TTL' : '$ttl sec TTL';

  DnsRecord({
    this.id,
    this.zoneId,
    this.zoneName,
    this.name,
    this.type,
    this.content,
    this.proxiable,
    this.proxied,
    this.ttl,
    this.locked,
    this.meta,
    this.createdOn,
    this.modifiedOn,
  });

  DnsRecord.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    zoneId = json['zone_id'];
    zoneName = json['zone_name'];
    name = json['name'];
    type = json['type'];
    content = json['content'];
    proxiable = json['proxiable'];
    proxied = json['proxied'];
    ttl = json['ttl'];
    locked = json['locked'];
    meta =
        json['meta'] != null ? DnsRecordMeta.fromJson(json['meta']) : null;
    createdOn = json['created_on'];
    modifiedOn = json['modified_on'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['zone_id'] = zoneId;
    data['zone_name'] = zoneName;
    data['name'] = name;
    data['type'] = type;
    data['content'] = content;
    data['proxiable'] = proxiable;
    data['proxied'] = proxied;
    data['ttl'] = ttl;
    data['locked'] = locked;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['created_on'] = createdOn;
    data['modified_on'] = modifiedOn;
    return data;
  }
}

class DnsRecordMeta {
  bool? autoAdded;
  bool? managedByApps;
  bool? managedByArgoTunnel;
  String? source;

  DnsRecordMeta({
    this.autoAdded,
    this.managedByApps,
    this.managedByArgoTunnel,
    this.source,
  });

  DnsRecordMeta.fromJson(Map<String, dynamic> json) {
    autoAdded = json['auto_added'];
    managedByApps = json['managed_by_apps'];
    managedByArgoTunnel = json['managed_by_argo_tunnel'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auto_added'] = autoAdded;
    data['managed_by_apps'] = managedByApps;
    data['managed_by_argo_tunnel'] = managedByArgoTunnel;
    data['source'] = source;
    return data;
  }
}
