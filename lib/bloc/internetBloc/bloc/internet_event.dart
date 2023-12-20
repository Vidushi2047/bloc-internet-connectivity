part of 'internet_bloc.dart';

abstract class InternetEvent {} //after using abstract we can't instance of InternetEvent Class

class InternetLostEvent extends InternetEvent {}

class InternetGainedEvent extends InternetEvent {}
