part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterLoadingState extends CounterState {}

class CounterLoadedState extends CounterState {
  int number;

  CounterLoadedState({required this.number});
}

class CounterErrorState extends CounterState {
  String message;

  CounterErrorState({required this.message});
}
