// create user usecase 
import 'package:flutter_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_clean_architecture/src/auth/domain/repositories/auth_repository.dart';

class CreateUser   {
  final AuthenticationRepository _repository;
 const CreateUser(this._repository);
    ResultFuture<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async  => await _repository.createUser(createdAt: createdAt, name: name, avatar: avatar);
  



}
