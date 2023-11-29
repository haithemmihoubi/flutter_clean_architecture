import 'package:flutter_clean_architecture/core/utils/typedef.dart';

import '../entities/user.dart';


abstract class AuthenticationRepository {
  //
  const AuthenticationRepository();
  //! result future is a typedef for Future<Either< Failure,T >  >
  // this will be creted as a usecase
  VoidResultFuture createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  // list of users
  ResultFuture<List<User>> getUsers();
  // get user by id
  ResultFuture<User> getUser(int id);
   
}
