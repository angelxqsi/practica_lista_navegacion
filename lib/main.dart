import 'package:flutter/material.dart'; //
import 'package:practica_lista_navegacion/model/task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo', // Título de la aplicación
      theme: ThemeData(
        // Tema de la aplicación
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Define el esquema de colores
        useMaterial3: true, // Habilita el uso de Material3
      ),
      home: TodoListScreen(tasks: lista), // Página inicial de la aplicación
    );
  }
}

// Widget para mostrar la lista de tareas
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.tasks});

  final List<Task> tasks; // Lista de tareas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'), // Título de la barra de aplicación
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, // Color de fondo de la barra de aplicación
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Número total de elementos en la lista
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title), // Título de la tarea
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(task: tasks[index])), // Navega a la pantalla de detalles
              );
            },
          );
        },
      ),
    );
  }
}

// Widget para mostrar los detalles de una tarea
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.task});

  final Task task; // Tarea

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title), // Título de la tarea
      ),
      body: Center(
        child: Text(task.description), // Descripción de la tarea
      ),
    );
  }
}
