import 'dart:math';

void main() {
  // METHOD 2

// ALT1 :WRONG
// 1 create a function that returns a random string

//   Future<double> getRandomValue() async {
//     var random = Random(2);
//     await Future.delayed(Duration(seconds: 1));
//     return random.nextDouble();
//   }

//   var value1 = await getRandomValue();
//   var value2 = await getRandomValue();

// ALT2 :CORRECT

// generator functions
  Stream<double> getRandomNumbers() async* {
    var randomNumber = Random(2);

    while (true) {
      // output means
      await Future.delayed(Duration(milliseconds: 100));
      late double num;
      yield randomNumber.nextDouble();

      // if (randomNumber => 0 ) {

      // } else {
      // }

    }
  }

  getRandomNumbers().listen((event) {
    print(event);
  });
}
