import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  // Arrange
  const tModel = UserModel.empty();
  test("should be a subclass of [User] entity", () {
    // Act
    // Assert
    expect(tModel, isA<User>());
  });

  final tJson = fixture("user.json");
  final tMap = jsonDecode(tJson) as DataMap;

  group("from map", () {
    test("should return a [UserModel] with the right data", () {
      //Arrange
      //Act
      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group("from json", () {
    test("should return a [UserModel] with the right data", () {
      //Arrange
      //Act
      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });

  group("to map", () {
    test("should return a [Map] with the right data", () {
      //Arrange
      //Act
      final result = tModel.toMap();
      expect(result, equals(tMap));
    });
  });

  group("to json", () {
    test("should return a [JSON] string with the right data", () {
      //Arrange
      //Act
      final tJson =
          jsonEncode({"id": "1", "avatar": "_empty.avatar", "createdAt": "_empty.createdAt", "name": "_empty.name"});
      final result = tModel.toJson();
      expect(result, equals(tJson));
    });
  });

  group("copy with", () {
    test("should return a [UserModel] with the different data", () {
      //Arrange
      //Act

      final result = tModel.copyWith(name: "Paul");

      expect(result.name, equals("Paul"));
    });
  });
}
