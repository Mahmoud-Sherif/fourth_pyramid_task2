import 'package:flutter/material.dart';

import '../config/routes/magic_router.dart';

showSnackBar(String message, {bool isError = false}) =>
    ScaffoldMessenger.of(MagicRouter.currentContext).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.blue,
      ),
    );
