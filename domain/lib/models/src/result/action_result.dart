import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_result.freezed.dart';

part 'action_result.g.dart';

@freezed
class ActionResult with _$ActionResult {
  const factory ActionResult({
    required bool success,
    required String message,
    required String? id,
  }) = _ActionResult;

  factory ActionResult.fromJson(Map<String, Object?> json) => _$ActionResultFromJson(json);
}
