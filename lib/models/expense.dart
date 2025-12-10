import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum Category { food, work, leisure, travel }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Category category;
  static const categoryIcon = {
    Category.food: Icons.lunch_dining,
    Category.travel: Icons.flight_takeoff,
    Category.leisure: Icons.movie,
    Category.work: Icons.work,
  };

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = Uuid().v4();
}
