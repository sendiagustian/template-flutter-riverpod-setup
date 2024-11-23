import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  static void pushNamed(
    BuildContext context,
    String name, {
    Map<String, String> pathParameters = const {},
    Map<String, dynamic> queryParameters = const {},
    Object? data,
    bool replace = false,
  }) {
    context.goNamed(name, pathParameters: pathParameters, queryParameters: queryParameters, extra: data);
  }

  static void push(BuildContext context, String route, {Object? data}) {
    context.go(route, extra: data);
  }

  static void pop(BuildContext context, {Object? data, int backMany = 1}) {
    for (var i = 0; i < backMany; i++) {
      context.pop(data);
    }
  }
}
