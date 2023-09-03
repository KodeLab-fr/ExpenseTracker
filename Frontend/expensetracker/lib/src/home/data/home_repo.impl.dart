import 'package:dartz/dartz.dart';
import 'package:expensetracker/shared/cache/storage.dart';
import 'package:expensetracker/shared/errors/failures.dart';
import 'package:expensetracker/src/home/domain/repositories/home_repo.dart';

class HomeRepoImpl with CacheManager implements HomeRepository {
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      removeToken();
      return const Right(null);
    } catch (error) {
      return Left(Failure(error, 520));
    }
  }
}
