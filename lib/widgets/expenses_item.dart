import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpensesItem extends StatelessWidget {
  Expense expense;
  ExpensesItem({Key? key, required this.expense}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text("${expense.amount.toStringAsFixed(2)}\$"),
                Spacer(),
                Row(
                  children: [
                    Icon(Expense.categoryIcon[expense.category]),
                    SizedBox(width: 8),
                    Text(DateFormat.yMd('en_US').format(expense.date)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
