import 'package:tdd_app_1/core/errors/failure.dart';

import 'package:fpdart/fpdart.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;
