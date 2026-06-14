import 'package:dart_lessen_1/dart_lessen_1.dart' as dart_lessen_1;

void main() {
  String name = 'Abdubais';
  int age = 20;
  String city = 'Bishkek';
  String profession = 'Future Developer';
  String hobby = 'Fixed-gear cycling';
  print("Hello! My name is $name.");
  print("I am $age years old and I live in $city.");
  print("My profession is $profession.");
  print("In my free time, I enjoy $hobby.");

  // Задание 2: Расчёт дохода
  int salary = 50000; // Твоя зарплата в сомах
  int yearlyIncome = salary * 12;

  // Находим 10% от годового дохода и прибавляем к нему
  int bonus = yearlyIncome ~/ 10;
  int yearlyIncomeWithBonus = yearlyIncome + bonus;

  print("My yearly income: $yearlyIncome KGS.");
  print("My yearly income with 10% bonus: $yearlyIncomeWithBonus KGS.");

  // Задание 3: Работа со строкой
  String text = " Knowledge is power, but practice makes perfect. ";

  // 1. Убираем пробелы спереди и сзади с помощью .trim()
  String cleanText = text.trim();
  print("Без пробелов: '$cleanText'");

  // 2. Делаем все буквы БОЛЬШИМИ с помощью .toUpperCase()
  String upperText = cleanText.toUpperCase();
  print("Капсом: $upperText");

  // 3. Меняем слово с помощью .replaceAll()
  String replacedText = cleanText.replaceAll("practice", "experience");
  print("Замена слова: $replacedText");

  // 4. Проверяем слово через .contains() (выдаст true или false)
  bool hasWord = cleanText.contains("power");
  print("Есть слово 'power'?: $hasWord");

  // Задание 4: Делим пиццу на пацанов
  int slices = 14; // Всего кусков пиццы
  int friends = 4; // Сколько человек сидит за столом

  int slicesPerEach = slices ~/ friends; // Сколько съест каждый
  int leftInBox = slices % friends; // Сколько останется в коробке

  print("Each person gets $slicesPerEach slices.");
  print("Slices left: $leftInBox.");

  // Задание 5: Считаем год рождения
  int currentYear = 2026;
  int myAge = 20;

  int bornYear = currentYear - myAge;

  print("I was born in $bornYear.");

  // Задание 6: var и final
  var myCity = "Bishkek";
  final myCountry = "Kyrgyzstan";

  // Меняем var — это можно
  myCity = "Osh";

  // Если раскомментировать строчку ниже, будет ошибка, потому что final менять нельзя!
  // myCountry = "Kazakhstan";

  print("City: $myCity");
  print("Country: $myCountry");

  /*
    Моё объяснение:
    var — это обычная переменная, значение которой можно перезаписать в любой момент.
    final — это переменная-константа. Ей дают значение один раз, и заблокировано, больше менять нельзя.
  */
}



