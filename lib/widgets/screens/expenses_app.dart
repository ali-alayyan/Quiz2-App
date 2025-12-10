import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesApp extends StatefulWidget {
  const ExpensesApp({super.key});

  @override
  State<ExpensesApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpensesApp> {
  final List<Expense> _registeredExpensesList = [
    Expense(
      title: 'Burger',
      amount: 5,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _updateList({
    required double amount,
    required String title,
    required DateTime date,
    required Category category,
  }) {
    setState(() {
      _registeredExpensesList.add(
        Expense(title: title, amount: amount, date: date, category: category),
      );
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(liftState: _updateList),
    );
  }

  void _deleteExpense(Expense expense) {
    int index = _registeredExpensesList.indexOf(expense);

    setState(() {
      _registeredExpensesList.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Deleted"),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpensesList.insert(index, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: ExpensesList(
        expensesList: _registeredExpensesList,
        onDeleteExpense: _deleteExpense,
      ),
    );
  }
}
