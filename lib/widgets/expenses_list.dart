import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  List<Expense> expensesList;
  void Function(Expense) onDeleteExpense;
  ExpensesList({
    Key? key,
    required this.expensesList,
    required this.onDeleteExpense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Dismissible(
        child: ExpensesItem(expense: expensesList[index]),
        key: ValueKey(expensesList[index]),
        onDismissed: (direction) {
          onDeleteExpense(expensesList[index]);
        },
      ),
      itemCount: expensesList.length,
    );
  }
}
