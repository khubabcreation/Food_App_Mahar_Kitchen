part of 'productlist_bloc.dart';

@immutable
abstract class ProductListState {}

class ProductListInitial extends ProductListState {}

class ProductListLoadingState extends ProductListState {}

class ProductListLoadedState extends ProductListState {
  final List<ProductModel> list;

  ProductListLoadedState({required this.list});
}

class ProductListErrorState extends ProductListState {
  final String message;

  ProductListErrorState(this.message);
}
