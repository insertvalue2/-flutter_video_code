import 'package:rest_api_example_http/models/todo.dart';
import 'package:rest_api_example_http/repository/repository.dart';

class TodoController {
  final Repository _repository;

  TodoController(this._repository);

  // get
  Future<List<Todo>> fetchTodoList() async {
    return _repository.getTodoList();
  }

  // patch
  Future<String> updatePatchCompleted(Todo todo) async {
    return _repository.patchCompleted(todo);
  }

  // put
  Future<String> updatePutCompleted(Todo todo) async {
    return _repository.putCompleted(todo);
  }

  // delete
  Future<String> deleteTodo(Todo todo) async {
    return _repository.deletedTodo(todo);
  }

  // post
  Future<String> postTodo(Todo todo) async {
    return _repository.postTodo(todo);
  }
}
