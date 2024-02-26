import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'password_rules_item.dart';

class PasswordRules extends StatelessWidget {
  const PasswordRules();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Password must contain:'),
        SizedBox(height: 8),
        PasswordRulesItem(
          rule: 'At least 12 characters',
        ),
        PasswordRulesItem(
          rule: 'At least one upper or lower case',
        ),
        PasswordRulesItem(
          rule: 'At least one special character',
        ),
      ],
    );
  }
}
