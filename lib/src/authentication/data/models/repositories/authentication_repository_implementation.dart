import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/utils/typedef.dart';

import 'package:flutter_clean_architecture/src/authentication/domain/entities/user.dart';

import '../../../domain/repositories/auth_repository.dart';
import '../datasources/authentication_remote_data-source.dart';

class AuthenticationRepositoryImplementation implements AuthenticationRepository {
    final  AuthenticationRemoteDataSource _remoteDataSource;
  const AuthenticationRepositoryImplementation(this._remoteDataSource);
  @override
  VoidResultFuture createUser({required String
  createdAt, required String name,
    required String avatar
  }) async {

  await _remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar);
  return const Right(null);

   }

  @override
  ResultFuture<User> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
  
}