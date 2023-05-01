import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'price_event.dart';

part 'price_state.dart';

class PriceBloc extends Bloc<PriceEvent, PriceState> {
  PriceBloc() : super(PriceInitial()) {

    on<priceLoad>((event, emit) {
      emit.call(priceLoadingState());
      try {

        emit.call(priceLoadedState(price:event.giveprice));
      } catch (e) {
        emit.call(priceErrorState(message: e.toString()));
      }
    });

    on<priceDecremet>((event, emit) {
      emit.call(priceLoadingState());
      try {
        emit.call(priceLoadedState(price: event.givePrice));
      } catch (e) {
        emit.call(priceErrorState(message: e.toString()));
      }
    });
  }
}
