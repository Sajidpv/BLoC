part of 'internet_bloc.dart';

sealed class InternetState {}

final class InternetInitialState extends InternetState {}

final class InternetGainedState extends InternetState {}

final class InternetLostState extends InternetState {}
