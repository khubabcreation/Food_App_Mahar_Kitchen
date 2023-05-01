import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      emit.call(CounterLoadingState());
      try {
        emit.call(CounterLoadedState(number: event.number));
      } catch (e) {
        emit.call(CounterErrorState(message: e.toString()));
      }
    });
    on<DecrementEvent>((event, emit) {
      emit.call(CounterLoadingState());
      try {
        emit.call(CounterLoadedState(number: event.number));
      } catch (e) {
        emit.call(CounterErrorState(message: e.toString()));
      }
    });
  }
}
