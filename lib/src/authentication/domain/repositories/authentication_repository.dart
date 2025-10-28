import 'package:fpdart/fpdart.dart';
import 'package:tdd_app_1/core/errors/failure.dart';
import 'package:tdd_app_1/core/utils/typedef.dart';
import 'package:tdd_app_1/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  //maneira longa
  /*
  Future<Either<Failure, void>> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  */
  ResultFuture<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  //maneira longa
  //Future<Either<Failure, List<User>>> getUsers();

  ResultFuture<List<User>> getUsers();
}
