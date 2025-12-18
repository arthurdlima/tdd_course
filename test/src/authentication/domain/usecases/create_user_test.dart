//what does this class depend on?
//How can we create a fake version of the dependency
//How do we controll what are denendecies

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_app_1/core/errors/failure.dart';
import 'package:tdd_app_1/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_app_1/src/authentication/domain/usecases/create_user.dart';

import 'authentiation_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();

  test('should call the [AuthRepo.createUser]', () async {
    //arrange

    //STUB
    when(
      () => repository.createUser(
        name: any(named: 'name'),
        avatar: any(named: 'avatar'),
        createdAt: any(named: 'createdAt'),
      ),
    ).thenAnswer((_) async => const Right(null));

    //act
    final result = await usecase(params);

    //assert
    expect(result, equals(const Right<Failure, void>(null)));

    verify(
      () => repository.createUser(
        name: params.name,
        avatar: params.avatar,
        createdAt: params.createdAt,
      ),
    ).called(1);

    verifyNoMoreInteractions(repository);
  });
}
