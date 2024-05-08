void main() {
  print(greetEveryone());

  print('Suma: ${addTwoNumbers(5, 5)}');

  print(greetPerson(name: 'Facundo', message: 'Hi,'));
}

// Aclarar de que tipo es para evitar 'dynamic'
// String greetEveryone() {
//   return 'Hello everyone!';
// }

// Función de flecha
String greetEveryone() => 'Hello everyone!';

// int addTwoNumbers(int a, int b) {
//   return a + b;
// }

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [int b = 0]) {
  // b ??= 0;

  return a + b;
}

String greetPerson({required String name, String message = 'Hola, '}) {
  return '$message Facundo';
}
