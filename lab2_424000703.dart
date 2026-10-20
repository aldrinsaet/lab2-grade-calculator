import 'dart:io';

class Student {
  String fullName;
  int idNumber;
  List<double> grades;

  Student(this.fullName, this.idNumber, this.grades);

  void displayInfo() {
    print('\n===== Student Record =====');
    print('Name : $fullName');
    print('ID   : $idNumber');
  }
}

double computeGrade(List<double> grades) {
  double total = 0;
  for (double g in grades) {
    total += g;
  }
  return total / grades.length;
}

String getStatus(double average) {
  if (average >= 75) {
    return 'Passed';
  } else if (average >= 70) {
    return 'Conditional';
  } else {
    return 'Failed';
  }
}

String readText(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }
    print('Input cannot be empty. Try again.');
  }
}

int readId(String prompt) {
  while (true) {
    int? id = int.tryParse(readText(prompt));
    if (id != null && id > 0) {
      return id;
    }
    print('Please enter a valid ID number.');
  }
}

double readGrade(String prompt) {
  while (true) {
    double? grade = double.tryParse(readText(prompt));
    if (grade != null && grade >= 0 && grade <= 100) {
      return grade;
    }
    print('Grade must be a number from 0 to 100.');
  }
}

void main() {
  print('=== Student Grade Calculator ===\n');

  String name = readText('Enter full name: ');
  int id = readId('Enter ID number: ');

  List<double> grades = [];
  for (int i = 1; i <= 3; i++) {
    grades.add(readGrade('Enter grade for Subject $i: '));
  }

  Student student = Student(name, id, grades);
  double average = computeGrade(student.grades);
  String status = getStatus(average);

  student.displayInfo();
  print('\n--- Grades ---');
  for (int i = 0; i < student.grades.length; i++) {
    print('Subject ${i + 1}: ${student.grades[i].toStringAsFixed(2)}');
  }

  print('\nAverage : ${average.toStringAsFixed(2)}');
  print('Status  : $status');
}
