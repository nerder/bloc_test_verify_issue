part of 'my_bloc_bloc.dart';

@immutable
abstract class MyBlocEvent extends Equatable {
    const MyBlocEvent();

  @override
  List<Object> get props => [];
}

class MyEvent extends MyBlocEvent {
  @override
  String toString() => 'MyEvent';
}