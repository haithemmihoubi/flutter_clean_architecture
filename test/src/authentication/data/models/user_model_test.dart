import 'dart:convert';
import 'dart:io';

import 'package:flutter_clean_architecture/src/authentication/data/models/user_model.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('UserModel', () {
    test('fromJson should create a UserModel from a map', () {
      final map = {
        'id': '1',
        'avatar': 'avatar1',
        'createdAt': '2023-11-29',
        'name': 'John',
      };
      final userModel = UserModel.fromMap(map);

      expect(userModel.id, '1');
      expect(userModel.avatar, 'avatar1');
      expect(userModel.createdAt, '2023-11-29');
      expect(userModel.name, 'John');
    });

    test('toJson should convert a UserModel to a map', () {
      final userModel =  File( 'test/fixtures/user.json' ).readAsStringSync().contains('toJson') ? UserModel.fromJson(const {
        'id': '1',
        'avatar': 'avatar1',
        'createdAt': '2023-11-29',
        'name': 'John',
      }) : const UserModel(id: '1', avatar: 'avatar1', createdAt: '2023-11-29', name: 'John');
      final map = userModel.toMap();

      expect(map['id'], '1');
      expect(map['avatar'], 'avatar1');
      expect(map['createdAt'], '2023-11-29');
      expect(map['name'], 'John');
    });

    test('copyWith should create a new UserModel with updated values', () {
      final userModel =  File( 'test/fixtures/user.json' ).readAsStringSync().contains('copyWith') ? UserModel.fromJson(const {
        'id': '1',
        'avatar': 'avatar1',
        'createdAt': '2023-11-29',
        'name': 'John',
      }) : const UserModel(id: '1', avatar: 'avatar1', createdAt: '2023-11-29', name: 'John');
      final updatedUserModel = userModel.copyWith(name: 'John Doe');

      expect(updatedUserModel.name, 'John Doe');
      expect(updatedUserModel.id, '1');
      expect(updatedUserModel.avatar, 'avatar1');
      expect(updatedUserModel.createdAt, '2023-11-29');
    });

    test('empty constructor should create a UserModel with default values', () {
      const emptyUserModel = UserModel.empty();

      expect(emptyUserModel.id, '0');
      expect(emptyUserModel.avatar, '');
      expect(emptyUserModel.createdAt, '');
      expect(emptyUserModel.name, '');
    });
  });
}
