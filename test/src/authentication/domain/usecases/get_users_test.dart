  import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/entities/user.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';



 // main method
void main() {
  // create a mock repository
  late MockAuthRepo repository;
  // create a CreateUserUseCase
  late GetUsers usecase;
  // setup the test for the CreateUserUseCase and the mock repository
  setUpAll(() {
    // create the mock repository
    repository = MockAuthRepo();
    // create the CreateUserUseCase
    usecase = GetUsers(repository);
  });
  //
  const params = CreateUserParams.empty();
  // list of users
  final tResponse= [const User.empty()] ;
  // test if the getUsersUseCase is working as expected
  test('should call the auth repository get users and return  a list of users ', () async {
    // arrange
    // Stub the repository
    when (()async =>  repository.getUsers()) // right is a typedef for Right<T,E> ans left is a typedef for Left<T,E>
        .thenAnswer((_) async =>    Right(tResponse)
    );
    // act
    final result =  await  usecase();
    // assert
    expect( result, Right(tResponse));
    // verify if the repository was called
    verify(() => repository.getUsers()).called( 1);

  });




}
