// 1️⃣ Класс Book 📚 [cite: 12]
class Book {
  // Приватные поля [cite: 14]
  String _title; // [cite: 15]
  String _author; // [cite: 16]
  double _rating; // [cite: 17, 28]

  // Обычный конструктор (принимает title и author, рейтинг по умолчанию 0.0) [cite: 19]
  Book(this._title, this._author) : _rating = 0.0;

  // Именованный конструктор [cite: 20]
  Book.withRating(this._title, this._author, double rating) : _rating = 0.0 {
    this.rating = rating; // Используем сеттер для валидации при создании
  }

  // Геттеры [cite: 22]
  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  // Сеттер для rating с проверкой диапазона от 0 до 10
  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print('Invalid rating! Must be between 0 and 10.');
    }
  }

  // Метод для вывода информации о книге [cite: 24]
  void displayInfo() {
    print('Title: $_title'); // [cite: 25]
    print('Author: $_author'); // [cite: 26]
    print('Rating: $_rating'); // [cite: 27]
  }
}

// 2️⃣ Класс Library 🏛️ [cite: 29]
class Library {
  String name; // Название библиотеки [cite: 32]
  final List<Book> _books = []; // Приватный список книг [cite: 33]

  // Конструктор [cite: 34]
  Library(this.name); // [cite: 35]

  // Метод добавления книги в список [cite: 37]
  void addBook(Book b) {
    _books.add(b);
  }

  // Геттер для получения количества книг (нужен для main) [cite: 54, 56]
  int get totalBooks => _books.length;

  // Метод вывода всех книг [cite: 38]
  void showBooks() {
    print('Library: $name'); // [cite: 39]
    print('Books list:'); // [cite: 40]
    // Цикл for с индексом для нумерации [cite: 43]
    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}. ${_books[i].title}'); // [cite: 41, 42]
    }
  }
}

// 3️⃣ Работа в main() 🧩 [cite: 44]
void main() {
  // 1. Создаем 3 книги разными способами [cite: 46]
  // Через обычный конструктор [cite: 47]
  Book book1 = Book('Harry Potter', 'J.K. Rowling');

  // Через именованный конструктор withRating [cite: 48]
  Book book2 = Book.withRating('Sherlock Holmes', 'Arthur Conan Doyle', 9.0);

  // Через сеттер рейтинга [cite: 49]
  Book book3 = Book('The Hobbit', 'J.R.R. Tolkien');
  book3.rating = 8.5;

  // 2. Создаем библиотеку [cite: 50]
  Library cityLib = Library('City Library'); // [cite: 51]

  // 3. Добавляем все книги [cite: 52]
  cityLib.addBook(book1);
  cityLib.addBook(book2);
  cityLib.addBook(book3);

  // 4. Выводим список книг [cite: 53]
  cityLib.showBooks();

  // 5. Выводим количество книг [cite: 54]
  print('Total books in library: ${cityLib.totalBooks}'); // [cite: 55]
}
