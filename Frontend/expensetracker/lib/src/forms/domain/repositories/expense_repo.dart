

import '../entities/expense_requests.dart';

abstract class ExpenseRepo {

  Future<Expense> add(Expense expense);

  Future<Expense> edit(Expense expense);

  Future<Expense> delete(Expense expense);

  Future<List<Expense>> getAll();
}
