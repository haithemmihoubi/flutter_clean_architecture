import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetUsers extends  UseCaseWithoutParams<List<User>>{
  //! inject the repository
  final AuthenticationRepository _repository;
  // constructor injection
  const GetUsers(this._repository);
  // call the repository method
  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();

}