import 'package:dartz/dartz.dart';
import 'package:expensetracker/core/errors/failures.dart';

abstract class HomeRepository {

Future<Either<Failure, void>> logout();

}

