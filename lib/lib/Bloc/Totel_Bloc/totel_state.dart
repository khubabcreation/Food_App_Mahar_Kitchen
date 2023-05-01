part of 'totel_bloc.dart';

@immutable
abstract class TotelState {}

class TotelInitial extends TotelState {}

class totelLoadinState extends TotelState {}

class totelLoadedState extends TotelState {
  String number;

  totelLoadedState({required this.number});
}

class totelErrorState extends TotelState {
  String message;

  totelErrorState({required this.message});
}
