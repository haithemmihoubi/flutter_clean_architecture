// create user usecase 
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/utils/typedef.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class CreateUser  extends UseCaseWithParams<void, CreateUserParams> {
  final AuthenticationRepository _repository;
 const CreateUser(this._repository);
 @override
  VoidResultFuture call(CreateUserParams params) {
      return _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
  }

}
// create a custom class for the params
class CreateUserParams  extends Equatable{
  final String createdAt;
  final String name;
  final String avatar;
  // empty  constructor
  const CreateUserParams.empty() : this(createdAt: '', name: '', avatar: '');
  const CreateUserParams({required this.createdAt, required this.name, required this.avatar});
  @override
  List<Object?> get props => [createdAt,name,avatar];
}