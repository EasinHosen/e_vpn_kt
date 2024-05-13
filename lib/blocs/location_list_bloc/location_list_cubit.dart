import 'package:e_vpn/services/api/vpn_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'location_list_state.dart';

class LocationListCubit extends Cubit<LocationListState> {
  // final VPNService vpnService;

  LocationListCubit() : super(LocationListDataLoadingState());

  Future<void> fetchLocations() async {
    final vpnService = VPNService();
    emit(LocationListDataLoadingState());
    try {
      final locations = await vpnService.getVpnList();
      // loggerDebug(
      //     'last entry[${locations.length}]', locations[locations.length - 1]);
      emit(LocationListDataLoadedState(locationList: locations));
    } catch (e) {
      emit(LocationListDataLoadErrorState(errorMessage: e.toString()));
    }
  }
}
