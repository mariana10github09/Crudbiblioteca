import 'dart:io';
void main() {
  List<Map<String, dynamic>> biblioteca = [
    {
      'titulo': 'El Quijote',
      'autor': 'Miguel de Cervantes',
      'anio': 1605,
    }
  ];
  bool continuar = true;
  while (continuar) {
    print('\n--- Menú Principal ---');
    print('1. Agregar libro');
    print('2. Listar libros');
    print('3. Actualizar libro');
    print('4. Eliminar libro');
    print('5. Salir');
    print('Seleccione una opción:');
    int? opcion = int.tryParse(stdin.readLineSync() ?? '');

    switch (opcion) {
      case 1:
        agregarLibro(biblioteca);
        break;
      case 2:
        listarLibros(biblioteca);
        break;
      case 3:
        actualizarLibro(biblioteca);
        break;
      case 4:
        eliminarLibro(biblioteca);
        break;
      case 5:
        continuar = false;
        print('Saliendo del programa...');
        break;
      default:
        print('Opción no válida, por favor intente de nuevo.');
    }
  }
}


void agregarLibro(List<Map<String, dynamic>> biblioteca) {
   bool CREARLIBRO = true;
   while(CREARLIBRO){
  print('Ingrese el título del libro:');
  String titulo = stdin.readLineSync() ?? '';
  print('Ingrese el autor del libro:');
  String autor = stdin.readLineSync() ?? '';
  print('Ingrese el año de publicación:');
  int? anio = int.tryParse(stdin.readLineSync() ?? '');

  if (titulo.isEmpty || autor.isEmpty || anio == null) {
    print('Entrada inválida. Por favor, intente de nuevo.');
    return;
  }

  biblioteca.add({'titulo': titulo, 'autor': autor, 'anio': anio});
  print('Libro agregado exitosamente.');
  print('¿Desea agregar otro libro? (s/n)');
  String respuesta = stdin.readLineSync() ?? '';
  if (respuesta.toLowerCase() != 's') {
    CREARLIBRO = false;
  }
   }

//listar libros
void listarLibros(List<Map<String, dynamic>> biblioteca) {
  print('--- Lista de Libros ---');

  if (biblioteca.isEmpty) {
    print('No hay libros registrados.');
    return;
  }


  for (int i = 0; i < biblioteca.length; i++) {
    print( ' $i: Título: ${biblioteca[i]['titulo']}, Autor: ${biblioteca[i]['autor']}, Año: ${biblioteca[i]['anio']}');
  }

}


void actualizarLibro(List<Map<String, dynamic>> biblioteca){
  listarLibros(biblioteca);
  print('Ingrese el índice del libro a actualizar:');
  int? indice = int.tryParse(stdin.readLineSync() ?? '');

  if (indice == null || indice < 0 || indice >= biblioteca.length) {
    print('Índice inválido. Por favor, intente de nuevo.');
    return;
  }

  print('Ingrese el nuevo título del libro:');
  String titulo = stdin.readLineSync() ?? '';
  print('Ingrese el nuevo autor del libro:');
  String autor = stdin.readLineSync() ?? '';
  print('Ingrese el nuevo año de publicación:');
  int? anio = int.tryParse(stdin.readLineSync() ?? '');

  if (titulo.isEmpty || autor.isEmpty || anio == null) {
    print('Entrada inválida. Por favor, intente de nuevo.');
    return;
  }

  biblioteca[indice] = {'titulo': titulo, 'autor': autor, 'anio': anio};
  print('Libro actualizado exitosamente.');
}

void eliminarLibro(List<Map<String, dynamic>> biblioteca){
  listarLibros(biblioteca);
  print('Ingrese el índice del libro a eliminar:');  
  int? indice = int.tryParse(stdin.readLineSync() ?? '');


  if (indice == null || indice < 0 || indice >= biblioteca.length) {
    print('Índice inválido. Por favor, intente de nuevo.');
    return;
  }

  biblioteca.removeAt(indice);
  print('Libro eliminado exitosamente.');
}}