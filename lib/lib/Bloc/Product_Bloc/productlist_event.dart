part of 'productlist_bloc.dart';

@immutable
abstract class ProductListEvent {}

class ProductItemListEvent extends ProductListEvent {
  String idNumber;

  ProductItemListEvent({required this.idNumber});
}

class GetAllProducts extends ProductListEvent {
  String? message = null;
}
