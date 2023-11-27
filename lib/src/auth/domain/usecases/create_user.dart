// create user usecase 
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_clean_architecture/src/auth/domain/repositories/auth_repository.dart';

import '../../../../core/usecase/usecase.dart';

class CreateUser  extends UsecaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _repository;
 const CreateUser(this._repository);
    ResultFuture<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  }) async  => await _repository.createUser(createdAt: createdAt, name: name, avatar: avatar);
  



}
// create a custom class for the params
class CreateUserParams  extends Equatable{
  final String createdAt;
  final String name;
  final String avatar;
  const CreateUserParams({required this.createdAt, required this.name, required this.avatar});
  @override
  List<Object?> get props => [createdAt,name,avatar];
}