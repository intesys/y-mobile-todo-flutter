import 'dart:convert';

import 'package:ytodos/src/data/entites/todo_item_entity.dart';
import 'package:http/http.dart' as http;
import 'package:ytodos/src/data/providers/todo_api_provider.dart';

class TodoProviderImpl implements TodoProvider {
  @override
  Future<List<TodoItemEntity>> getTodoItems() async {
    var url = Uri.http('allbrain.it', 'ytodo/api.php', {'user_id': '1'});
    var response = await http.get(url);
    return (jsonDecode(response.body) as List)
        .map((todo) => TodoItemEntity.fromJson(todo))
        .toList();
  }
}
