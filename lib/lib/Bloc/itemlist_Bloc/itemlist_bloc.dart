import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../ApiServices/ProductList_Services.dart';
import '../../Models/ProductList_Model.dart';

part 'itemlist_event.dart';

part 'itemlist_state.dart';

class ItemlistBloc extends Bloc<ItemlistEvent, ItemlistState> {
  ItemlistBloc() : super(ItemlistInitial()) {
    on<getitemEvent>((event, emit) async {
      ProductList productList = ProductList();

      emit.call(itemlistLoadingState());
      try {
        emit.call(
            itemlistLoadedState(itemlist: await productList.getProductlist()));
      } catch (e) {
        emit.call(itemlistErrorState(message: e.toString()));
      }
    });
  }
}
