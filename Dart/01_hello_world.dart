void main() {
  // var myName = 'Facundo';
  // final myName = 'Facundo'; // No permite cambiar el valor
  // late final myName = 'Facundo'; // Inicialización tardía
  // String myName = 'Facundo';
  const myName = 'Facundo'; // Constante en tiempo de construcción de APP

  print('Hola $myName');
  print('Hola ${myName.toUpperCase()}');
  print('Hola ${1 + 1}');
}
