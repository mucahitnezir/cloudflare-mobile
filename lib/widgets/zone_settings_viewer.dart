import 'package:cloudflare_mobile/business/dto/zone_settings_identifier_dto.dart';
import 'package:cloudflare_mobile/business/models/api_response.dart';
import 'package:cloudflare_mobile/business/models/zone_settings.dart';
import 'package:cloudflare_mobile/business/services/cloudflare_service.dart';
import 'package:flutter/material.dart';

class ZoneSettingsViewer extends StatefulWidget {
  final ZoneSettingsIdentifierDto identifierDto;

  const ZoneSettingsViewer({
    Key? key,
    required this.identifierDto,
  }) : super(key: key);

  @override
  State<ZoneSettingsViewer> createState() => _ZoneSettingsViewerState();
}

class _ZoneSettingsViewerState extends State<ZoneSettingsViewer> {
  ApiResponse<ZoneSettings, ZoneSettings>? zoneSettings;

  @override
  void initState() {
    super.initState();

    _fetch();
  }

  Future<void> _fetch() async {
    var settings = await CloudflareService.instance.fetchZoneSettings(widget.identifierDto);

    setState(() {
      zoneSettings = settings;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.identifierDto.title),
      value: _getValue,
      onChanged: (bool value) {},
    );
  }

  bool get _getValue {
    if (zoneSettings == null) {
      return false;
    }

    return zoneSettings!.result!.value == 'on';
  }
}
