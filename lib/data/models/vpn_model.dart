class VPNModel {
  late final String hostname;
  late final String ip;
  late final String ping;
  late final String speed;
  late final String countryLong;
  late final String countryShort;
  late final String numVpnSessions;
  late final String openVPNConfigDataBase64;

  VPNModel(
      {required this.hostname,
      required this.ip,
      required this.ping,
      required this.speed,
      required this.countryLong,
      required this.countryShort,
      required this.numVpnSessions,
      required this.openVPNConfigDataBase64});

  VPNModel.fromJson(Map<String, dynamic> json) {
    hostname = json['HostName'] ?? '';
    ip = json['IP'] ?? '';
    ping = json['Ping'].toString();
    speed = json['Speed'].toString();
    countryLong = json['CountryLong'] ?? '';
    countryShort = json['CountryShort'] ?? '';
    numVpnSessions = json['NumVpnSessions'].toString();

    openVPNConfigDataBase64 = json['OpenVPN_ConfigData_Base64'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['HostName'] = hostname;
    data['IP'] = ip;
    data['Ping'] = ping;
    data['Speed'] = speed;
    data['CountryLong'] = countryLong;
    data['CountryShort'] = countryShort;
    data['NumVpnSessions'] = numVpnSessions;
    data['OpenVPN_ConfigData_Base64'] = openVPNConfigDataBase64;
    return data;
  }

  @override
  String toString() {
    return 'VPNModel{hostname: $hostname, ip: $ip, ping: $ping, speed: $speed, countryLong: $countryLong, countryShort: $countryShort, numVpnSessions: $numVpnSessions, openVPNConfigDataBase64: $openVPNConfigDataBase64}';
  }
}
