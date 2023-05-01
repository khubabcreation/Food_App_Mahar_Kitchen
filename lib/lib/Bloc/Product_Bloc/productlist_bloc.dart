import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fooood/lib/ApiServices/Product_Service.dart';

import 'package:meta/meta.dart';

import '../../Models/Product_Model.dart';

part 'productlist_event.dart';

part 'productlist_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<ProductItemListEvent>((event, emit) async {
      ProductService service = ProductService();
      List<ProductModel> list = await service.getProductlist(event.idNumber);

      emit.call(ProductListLoadingState());
      try {
        emit.call(ProductListLoadedState(list: list));
      } catch (e) {
        emit.call(ProductListErrorState(e.toString()));
      }
    });

    on<GetAllProducts>((event, emit) async {
      ProductService service = ProductService();
      List<ProductModel> list = await service.getProductlist(event.message);

      emit.call(ProductListLoadingState());
      try {
        emit.call(ProductListLoadedState(list: list));
      } catch (e) {
        emit.call(ProductListErrorState(e.toString()));
      }
    });
  }
}
