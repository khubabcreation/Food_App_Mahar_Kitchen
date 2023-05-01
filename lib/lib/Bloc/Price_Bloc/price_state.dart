part of 'price_bloc.dart';

@immutable
abstract class PriceState {}

class PriceInitial extends PriceState {}

class priceLoadingState extends PriceState {}

class priceLoadedState extends PriceState {
  String price;

  priceLoadedState({required this.price});
}

class priceErrorState extends PriceState {
  String message;

  priceErrorState({required this.message});
}
