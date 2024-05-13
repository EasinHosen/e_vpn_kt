import 'package:e_vpn/data/models/vpn_model.dart';
import 'package:equatable/equatable.dart';

abstract class LocationListState extends Equatable {}

class LocationListDataLoadingState extends LocationListState {
  @override
  List<Object?> get props => [];
}

class LocationListDataLoadedState extends LocationListState {
  LocationListDataLoadedState({required this.locationList});

  final List<VPNModel> locationList;
  @override
  List<Object?> get props => [locationList];
}

class LocationListDataLoadErrorState extends LocationListState {
  LocationListDataLoadErrorState({required this.errorMessage});

  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
