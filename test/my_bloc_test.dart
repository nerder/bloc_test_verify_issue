import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_issue_repo/bloc/my_bloc_bloc.dart';
import 'package:bloc_test_issue_repo/my_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockMyRepository extends Mock implements MyRepository {}

void main() {
  group("Test", () {
    MockMyRepository mockMyRepository;
    setUp(() {
      mockMyRepository = MockMyRepository();
      when(mockMyRepository.getTheAnswer()).thenAnswer((_) {
        return 42;
      });
    });

    //This one passes, since verify is correctly evaluated
    blocTest(
      "my test",
      build: () => MyBlocBloc(myRepository: mockMyRepository),
      act: (bloc) => bloc.add(MyEvent()),
      expect: [],
      verify: (_) {
        verify(mockMyRepository.getTheAnswer()).called(1);
      },
    );
    
    //This one hangs, and fail because of the timeout instead of failing returning the verify exception
    blocTest(
      "my test",
      build: () => MyBlocBloc(myRepository: mockMyRepository),
      act: (bloc) => bloc.add(MyEvent()),
      expect: [],
      verify: (_) {
        verify(mockMyRepository.getTheAnswer()).called(2);
      },
    );
  });
}
