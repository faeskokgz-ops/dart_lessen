void main() {
  // Задание 1
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }

  // Задание 2
  List<int> numbers = [3, -2, 0, 7, -5, 10, 1];
  int count = 0;
  int sum = 0;

  for (int number in numbers) {
    if (number > 0) {
      sum += number;
      count++;
    }
  }

  if (count > 0) {
    double average = sum / count;
    print('Positive numbers count: $count');
    print('Average of positive numbers: $average');
  } else {
    print('No positive numbers.');
  }

  // Задание 3
  Map<String, int> fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};

  fruits.forEach((key, value) {
    if (value > 0) {
      print('Available: $key ($value pcs)');
    }
  });
}
