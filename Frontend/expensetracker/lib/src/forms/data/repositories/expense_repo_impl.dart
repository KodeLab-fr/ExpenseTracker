
import '../../domain/entities/expense_requests.dart';
import '../../domain/repositories/expense_repo.dart';

class ExpenseRepoImpl implements ExpenseRepo {


  @override
  Future<Expense> add(Expense expense) async {
    throw UnimplementedError();
  }

  @override
  Future<Expense> delete(Expense expense) async {
    throw UnimplementedError();
  }

  @override
  Future<Expense> edit(Expense expense) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Expense>> getAll() async {
    throw UnimplementedError();
  }
}