import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app_1/src/authentication/data/models/user_model.dart';
import 'package:tdd_app_1/src/authentication/domain/entities/user.dart';

void main() {
  test('should be a subclass of [User] entity', () {
    //Arrange
    const tModel = UserModel.empty();

    // Act

    // Assert
    expect(tModel, isA<User>());
  });
}
