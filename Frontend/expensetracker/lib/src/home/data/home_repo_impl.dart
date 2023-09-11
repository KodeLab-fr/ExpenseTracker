import 'package:dartz/dartz.dart';
import 'package:expensetracker/core/cache/storage.dart';
import 'package:expensetracker/core/errors/failures.dart';
import 'package:expensetracker/src/home/domain/repositories/home-repo.dart';

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
