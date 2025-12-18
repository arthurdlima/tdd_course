import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_app_1/core/errors/failure.dart';
import 'package:tdd_app_1/src/authentication/domain/entities/user.dart';
import 'package:tdd_app_1/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_app_1/src/authentication/domain/usecases/get_users.dart';

import 'authentiation_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [User.empty()];

  test('should call [AuthRepo.getUsers] and return [List<User>]', () async {
    //Arrange
    when(
      () => repository.getUsers(),
    ).thenAnswer((_) async => const Right(tResponse));

    //Act
    final result = await usecase();

    //assert
    expect(result, equals(const Right<Failure, List<User>>(tResponse)));

    verify(() => repository.getUsers()).called(1);

    verifyNoMoreInteractions(repository);
  });
}
