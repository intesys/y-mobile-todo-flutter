class TodoParamsPayload {
  static const String _userId = '1';

  static Map<String, dynamic> toJson([String? todoItemId]) {
    return <String, dynamic>{
      'user_id': _userId,
      if (todoItemId != null) 'id': todoItemId,
    };
  }
}
