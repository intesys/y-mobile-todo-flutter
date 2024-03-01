import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ytodos/src/data/entites/todo_item_entity.dart';
import 'package:ytodos/src/data/payloads/todo_params_payload.dart';
import 'package:ytodos/src/data/providers/todo_api_provider.dart';
import 'package:ytodos/src/utils/app_constants.dart';

class TodoProviderImpl implements TodoProvider {
  @override
  Future<List<TodoItemEntity>> getTodoItems() async {
    final Uri url = Uri.http(
      AppConstants.url,
      AppConstants.path,
      TodoParamsPayload.toJson(),
    );
    final Response response = await http.get(url);
    return (jsonDecode(response.body) as List<dynamic>)
        .map((dynamic todo) => TodoItemEntity.fromJson(todo))
        .toList();
  }

  @override
  Future<String?> addTodoItem(String text) async {
    try {
      final Uri url = Uri.http(
        AppConstants.url,
        AppConstants.path,
        TodoParamsPayload.toJson(),
      );
      final Response response =
          await http.post(url, body: jsonEncode(<String, String>{'text': text}));
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      if (decodedResponse['success'] == true) {
        return decodedResponse['id'];
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> changeTodoItemStatus(TodoItemEntity todoItem) async {
    try {
      final Uri url = Uri.http(
        AppConstants.url,
        AppConstants.path,
        TodoParamsPayload.toJson(todoItem.id),
      );
      final Response response =
          await http.patch(url, body: jsonEncode(<String, bool>{'completed': todoItem.completed}));
      return jsonDecode(response.body)['success'];
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteTodoItem(String id) async {
    try {
      final Uri url = Uri.http(
        AppConstants.url,
        AppConstants.path,
        TodoParamsPayload.toJson(id),
      );
      final Response response = await http.delete(url);
      return jsonDecode(response.body)['success'];
    } catch (e) {
      return false;
    }
  }
}
