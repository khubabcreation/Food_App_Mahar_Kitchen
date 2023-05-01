part of 'totel_bloc.dart';

@immutable
abstract class TotelEvent {}

class numberFetchEvent extends TotelEvent {
  String number;

  numberFetchEvent({required this.number});
}
