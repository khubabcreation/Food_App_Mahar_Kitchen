part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  int number;

  IncrementEvent({required this.number});
}

class DecrementEvent extends CounterEvent {
  int number;

  DecrementEvent({required this.number});
}
