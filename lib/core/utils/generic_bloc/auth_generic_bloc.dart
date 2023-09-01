
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_generic_event.dart';
part 'auth_generic_state.dart';

class GenericBloc<T> extends Bloc<GenericEvent<T>, GenericState<T>> {
  GenericBloc({T? data}) : super(GenericInitial<T>(data)) {
    on<GenericEvent<T>>((event, emit) {
      if(event is GenericUpdateEvent<T>){
        emit(GenericUpdate(change: !state.change, data: event.data));
      }
    });
  }
}
