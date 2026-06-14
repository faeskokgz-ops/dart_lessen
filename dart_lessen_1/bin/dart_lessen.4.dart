// hi sensei
// Глобальная переменная
int totalCalls = 0;

void main() {
  // Задание 1: greet
  greet();
  greet();
  greet();

  print('---');

  // Задание 2: introduce
  introduce('Alex', 25);
  introduce('Maria', 30);
  introduce('John', 19);

  print('---');

  // Задание 3: addNumbers
  int sumResult = addNumbers(5, 8);
  print('Sum of 5 and 8 is $sumResult.');

  print('---');

  // Задание 4: calculateDiscount
  double res1 = calculateDiscount(price: 100.0);
  print('Final price: \$${res1}');

  double res2 = calculateDiscount(price: 100.0, discount: 10);
  print('Final price: \$${res2}');

  double res3 = calculateDiscount(price: 100.0, discount: 10, tax: 5);
  print('Final price: \$${res3}');

  print('---');

  // Финал
  print('Total function calls: $totalCalls');
}

// Функции к заданию 1
void greet() {
  totalCalls++;
  print('Hello! Welcome to Dart programming!');
}

// Функции к заданию 2
void introduce(String name, int age) {
  totalCalls++;
  print('My name is $name and I am $age years old.');
}

// Функции к заданию 3
int addNumbers(int a, int b) {
  totalCalls++;
  return a + b;
}

// Функции к заданию 4
double calculateDiscount({required double price, double discount = 0, double tax = 0}) {
  totalCalls++;
  double finalPrice = price - (price * discount / 100) + (price * tax / 100);
  return finalPrice;
}
