part of 'price_bloc.dart';

@immutable
abstract class PriceEvent {}

class priceLoad extends PriceEvent {
  String giveprice;
  priceLoad({required this.giveprice});
}

class priceDecremet extends PriceEvent {
  String givePrice;

  priceDecremet({required this.givePrice});
}
