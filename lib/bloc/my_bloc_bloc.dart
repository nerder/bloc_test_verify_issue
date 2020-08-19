import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_issue_repo/my_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'my_bloc_event.dart';
part 'my_bloc_state.dart';

class MyBlocBloc extends Bloc<MyBlocEvent, MyBlocState> {
  final MyRepository myRepository;

  MyBlocBloc({this.myRepository}) : super(MyBlocInitial());

  @override
  Stream<MyBlocState> mapEventToState(
    MyBlocEvent event,
  ) async* {
    if(event is MyEvent) {
      this.myRepository.getTheAnswer();
    }
  }
}
