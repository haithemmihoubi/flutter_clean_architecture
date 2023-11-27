import 'package:flutter_clean_architecture/core/utils/typedef.dart';
import 'package:flutter_clean_architecture/src/auth/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();
  //! result future is a typedef for Future<Either< Failure,T >  >
 ResultFuture<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  // list of users
  ResultFuture<List<User>> listUsers();
  // get user by id
  ResultFuture<User> getUser(int id);
   
}
