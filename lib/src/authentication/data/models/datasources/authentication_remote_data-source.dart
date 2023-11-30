import 'package:flutter_clean_architecture/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
 Future createUser({required String createdAt, required String name, required String avatar});
 Future<List<UserModel>> getUsers();


}


