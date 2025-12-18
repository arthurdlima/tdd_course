import 'package:tdd_app_1/core/usecase/usecase.dart';
import 'package:tdd_app_1/core/utils/typedef.dart';
import 'package:tdd_app_1/src/authentication/domain/repositories/authentication_repository.dart';

import '../entities/user.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);
  final AuthenticationRepository _repository;
  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
