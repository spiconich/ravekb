import 'package:flutter/material.dart';

abstract class Section {
  String get type;
  Widget build(BuildContext context); // Переименовали в build для единообразия
}
