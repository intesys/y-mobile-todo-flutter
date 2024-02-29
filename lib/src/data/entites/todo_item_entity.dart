import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_entity.freezed.dart';
part 'todo_item_entity.g.dart';

@freezed
class TodoItemEntity with _$TodoItemEntity {

  const factory TodoItemEntity({
    required String id,
    required String text,
    @Default(false) bool completed,
}) = _TodoItemEntity;
  factory TodoItemEntity.fromJson(Map<String, dynamic> json) => _$TodoItemEntityFromJson(json);
}