import 'package:ytodos/src/data/entites/todo_item_entity.dart';
import 'package:ytodos/src/domain/models/todo_item_model.dart';

abstract class TodoMapper {
  static TodoItemModel toModel(TodoItemEntity entity) {
    return TodoItemModel(
      id: entity.id,
      text: entity.text,
      completed: entity.completed,
    );
  }

  static TodoItemEntity toEntity(TodoItemModel model) {
    return TodoItemEntity(
      id: model.id,
      text: model.text,
      completed: model.completed,
    );
  }
}
