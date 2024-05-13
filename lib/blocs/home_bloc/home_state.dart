// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {}

class HomeServiceDataLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeServiceDataLoadedState extends HomeState {
  HomeServiceDataLoadedState();

  @override
  List<Object?> get props => [];
}

class HomeServiceDataLoadErrorState extends HomeState {
  HomeServiceDataLoadErrorState({required this.errorMessage});

  String errorMessage = '';
  @override
  List<Object?> get props => [errorMessage];
}

class HomeLanguageButtonState extends HomeState {
  HomeLanguageButtonState({required this.value});
  final bool value;

  @override
  List<Object?> get props => [value];
}
