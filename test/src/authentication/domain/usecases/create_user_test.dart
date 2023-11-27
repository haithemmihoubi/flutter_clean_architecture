// what does this test do?
// 1. test if the CreateUserUseCase is working as expected
// 2. test if the CreateUserUseCase is calling the UserRepository
// 3. test if the CreateUserUseCase is calling the UserRepository with the correct parameters
// 4. test if the CreateUserUseCase is returning the correct value
// use either mocktail or mockito
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/usecases/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';





// main method
void main() {
  // create a mock repository
  late MockAuthRepo repository;
  // create a CreateUserUseCase
  late CreateUser createUser;
  // setup the test for the CreateUserUseCase and the mock repository
  setUpAll(() {
    // create the mock repository
    repository = MockAuthRepo();
    // create the CreateUserUseCase
    createUser = CreateUser(repository);
  });
  //
   const params = CreateUserParams.empty();


  // test if the CreateUserUseCase is working as expected
  test('should call the auth repository', () async {
    // arrange
    // Stub the repository
   when (() => repository.createUser(createdAt:  any(named:'createdAt' )
       , name:  any(named:'name')
       , avatar:  any(named: 'avatar' )
   ))
   // right is a typedef for Right<T,E> ans left is a typedef for Left<T,E>
       .thenAnswer((_) async =>  const Right(null)
   );
    // act

 final result =  await createUser(params);
    // assert
    expect( result, const Right(null));
    // verify if the repository was called
    verify(() => repository.createUser(createdAt:   params.createdAt
        , name:  params.name ,
        avatar: params. avatar
    )).called( 1);
    verifyNoMoreInteractions( repository);
  });



}