part of 'auth_generic_bloc.dart';

abstract class GenericEvent<T> extends Equatable {
  const GenericEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class GenericUpdateEvent<T> extends GenericEvent<T> {
  final T data;

  const GenericUpdateEvent(this.data);

  @override
  // TODO: implement props
  List<Object?> get props =>[data];
}
