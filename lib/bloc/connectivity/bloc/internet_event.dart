part of 'internet_bloc.dart';

sealed class InternetEvent {}

class InternetGainedEvent extends InternetEvent {}

class InternetLostEvent extends InternetEvent {}
