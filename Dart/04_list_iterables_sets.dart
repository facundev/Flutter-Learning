void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9]; // List -> []

  print('Original list: $numbers');
  print('Length: ${numbers.length}');
  print('Index 0: ${numbers[0]}');
  print('First: ${numbers.first}');
  print('Last: ${numbers.last}');
  print('Reversed: ${numbers.reversed}'); //

  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}'); // Lista != iterable
  print('Set: ${reversedNumbers.toSet()}'); // Elimina valores duplicados

  print(
      'Original list: ${numbers.toSet().toList()}'); // Eliminar duplicados y pasar a lista

  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5; // true or false
  });
  print('>5: $numbersGreaterThan5'); // Iterable
  print('>5: ${numbersGreaterThan5.toSet()}'); // Set, elimina duplicados
}
