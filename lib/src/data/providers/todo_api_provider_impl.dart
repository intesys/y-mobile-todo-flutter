import 'dart:convert';

import 'package:http/http.dart';
import 'package:ytodos/src/data/entites/todo_item_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ytodos/src/data/providers/todo_api_provider.dart';

class TodoProviderImpl implements TodoProvider {
  @override
  Future<List<TodoItemEntity>> getTodoItems() async {
    final Uri url = Uri.http('www.allbrain.it', 'ytodo/api.php', {'user_id': '1'});
    final Response response = await http.get(url);
    print(response.body);
    return (jsonDecode(response.body) as List)
        .map((todo) => TodoItemEntity.fromJson(todo))
        .toList();
  }

  @override
  Future<String?> addTodoItem(String text) async {
    final Uri url = Uri.http('www.allbrain.it', 'ytodo/api.php', {'user_id': '1'});
    final Response response = await http.post(url, body: jsonEncode({'text': text}));
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    if (decodedResponse['success'] == true) {
      return decodedResponse['id'];
    } else {
      return null;
    }
  }

  @override
  Future<bool> changeTodoItemStatus(TodoItemEntity todoItem) async {
    final Uri url = Uri.http('www.allbrain.it', 'ytodo/api.php', {'user_id': '1', 'id': todoItem.id});
    final Response response = await http.patch(url);
    print(response.body);
    return jsonDecode(response.body)['success'];
  }

  @override
  Future<bool> deleteTodoItem(String id) async {
    final Uri url = Uri.http('www.allbrain.it', 'ytodo/api.php', {'user_id': '1', 'id': id});
    final Response response = await http.delete(url);
    print(response.body);
    return jsonDecode(response.body)['success'];
  }
}
