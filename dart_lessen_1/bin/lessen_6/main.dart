import 'subjects.dart';
import 'student.dart';
import 'teacher.dart';

void main() {
  Teacher teacher = Teacher('John Brown', 40, true, 5);
  teacher.introduce();
  print('');

  Student student1 = Student('Adam White', 17, false, {
    Subject.math: 90,
    Subject.physics: 85,
    Subject.english: 92,
    Subject.history: 88,
  });
  student1.introduce();
  student1.showMarks();
  print('');

  Student student2 = Student('Alice Green', 18, false, {
    Subject.math: 75,
    Subject.physics: 80,
    Subject.english: 95,
  });
  student2.introduce();
  student2.showMarks();
}