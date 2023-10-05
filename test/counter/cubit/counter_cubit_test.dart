import 'package:driver_app/features/main/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(MainView, equals(0));
    });
  });

  //   blocTest<MainView, String>(
  //     'emits [1] when increment is called',
  //     build: MainView.new,
  //     act: (cubit) => cubit.debugDescribeChildren(),
  //     expect: () => [equals(1)],
  //   );
  //
  //   blocTest<MainView, int>(
  //     'emits [-1] when decrement is called',
  //     build: MainView.new,
  //     act: (cubit) => cubit.(),
  //     expect: () => [equals(-1)],
  //   );
  // });
}
