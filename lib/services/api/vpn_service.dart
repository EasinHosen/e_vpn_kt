import 'package:csv/csv.dart';
import 'package:e_vpn/services/api/api_services.dart';

import '../../data/models/vpn_model.dart';

class VPNService {
  Future<List<VPNModel>> getVpnList() async {
    List<VPNModel> vpnList = [];
    try {
      final response = await ApiServices.instance
          .getDio()
          .get('https://www.vpngate.net/api/iphone/');
      final csvString = response.data.split("#")[1].replaceAll("*", "");
      final List<List<dynamic>> convertedJsonList =
          const CsvToListConverter().convert(csvString);

      if (convertedJsonList.length <= 1) {
        print('CSV data contains only header or is empty.');
        return vpnList;
      }

      final header = convertedJsonList[0];

      for (int i = 1; i < convertedJsonList.length; ++i) {
        Map<String, dynamic> tempJson = {};
        bool isEmpty = true; // Assume the row is empty initially
        for (int j = 0; j < header.length; ++j) {
          dynamic value =
              convertedJsonList[i].length > j ? convertedJsonList[i][j] : '';
          dynamic defaultValue = ''; // Default to empty string for most cases
          // Insert appropriate default value based on the expected data type
          if (header[j] == 'expectedIntegerColumnName') {
            defaultValue = 0; // Default integer value
            value = value.isNotEmpty ? int.tryParse(value) ?? 0 : 0;
          }
          // Add more conditions here for other data types as needed
          tempJson.addAll({header[j]: value});
          if (value != defaultValue) {
            isEmpty = false; // Found non-default value, row is not empty
          }
        }
        if (!isEmpty) {
          vpnList.add(VPNModel.fromJson(tempJson));
        }
      }

      return vpnList;
    } catch (e) {
      print('getVpnList exception: $e');
      rethrow;
    }
  }
}
