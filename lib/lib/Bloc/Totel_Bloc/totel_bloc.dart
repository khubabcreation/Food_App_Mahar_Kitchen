import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'totel_event.dart';

part 'totel_state.dart';

class TotelBloc extends Bloc<TotelEvent, TotelState> {
  TotelBloc() : super(TotelInitial()) {
    on<numberFetchEvent>((event, emit) {
      emit.call(totelLoadinState());
      try {
        emit.call(totelLoadedState(number: event.number));
      } catch (e) {
        emit.call(totelErrorState(message: e.toString()));
      }
    });
  }
}
