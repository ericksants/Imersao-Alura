import 'dart:async';
import 'models/task.dart';

StreamController<String> _streamController = StreamController<String>();
//Stream<String> get stream => _streamController.stream;

void main() {
  TaskManager taskManager = TaskManager();
  StreamSubscription subscription = taskManager.stream.listen((message) {
    print("Notificação: $message");
  });
}

class TaskManager {
  final List<Task> _listTasks = []; // Perceba que "Task" ainda não existe.

  Stream<String> get stream => _streamController.stream;

  addTask(Task task) {
    _listTasks.add(task);
    _streamController.add("Nova tarefa ${task.title} adicionada.");
  }

  toggleTaskStatus(String id) {
    int index = _listTasks.indexWhere((task) => task.id == id);
    Task task = _listTasks[index];
    task.isCompleted = !task.isCompleted;
    _listTasks[index] = task;
    if (task.isCompleted) {
      _streamController.add("${task.title} foi concluída.");
    } else {
      _streamController.add("${task.title} ainda não concluída.");
    }
  }

  List<Task> getAll() {
    _streamController.add("Visualização de todas as tarefas foi solicitada.");
    return _listTasks;
  }

  Task getById(String id) {
    _streamController.add("Tarefa encontrada.");
    return _listTasks.firstWhere((task) => task.id == id);
  }

  delete(String id) {
    _streamController.add("Tarefa removida");
    _listTasks.removeWhere((task) => task.id == id);
  }
}
