import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
}