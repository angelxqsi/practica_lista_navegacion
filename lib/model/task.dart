import 'package:practica_lista_navegacion/main.dart';

class Task {
  final String title;
  final String description;
  const Task(this.title, this.description);
}

final lista = List.generate(
    20,
        (index) => Task('Tarea número: $index',
        'Description de la tarea número $index')); // List.generate