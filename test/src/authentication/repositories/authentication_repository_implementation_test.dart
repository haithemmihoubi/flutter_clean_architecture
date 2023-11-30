import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_clean_architecture/core/errors/failure.dart';
import 'package:flutter_clean_architecture/src/authentication/data/models/datasources/authentication_remote_data-source.dart';
import 'package:flutter_clean_architecture/src/authentication/data/models/repositories/authentication_repository_implementation.dart';
import 'package:flutter_clean_architecture/src/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {


  }
  void main() {


    late AuthenticationRepositoryImplementation authenticationRepositoryImplementation;
    late AuthenticationRemoteDataSource remoteDataSource;
    setUp(() {
      remoteDataSource =   MockAuthenticationRemoteDataSource();
      authenticationRepositoryImplementation = AuthenticationRepositoryImplementation(remoteDataSource);

    });
    group('createUser', () {
      test('should call the remote data source to create a user', () async {
        // arrange
        when(() => remoteDataSource.createUser(createdAt:  any(named: 'createdAt'), name: any(named: 'name'), avatar: any(named: 'avatar')

        )).thenAnswer((_) async =>  Future.value());
        const  createdAt = 'testcreatedAt';
        const  name = 'testname';
        const  avatar = 'testavatar';

        // act
        final result = await authenticationRepositoryImplementation.createUser(createdAt: 'createdAt', name: 'name', avatar: 'avatar');
        // assert
        expect(result, equals(const Right(null)));
        verify(
          () => remoteDataSource.createUser(createdAt: 'createdAt', name: 'name', avatar: 'avatar')
        ).called( 1);
 verifyNoMoreInteractions( remoteDataSource);
      });
    });
    // should return a server failure when the call to remote data source is unsuccessful
     test( 'should return a server failure when the call to remote data source is unsuccessful' ,
          () async {
            // arrange
            when(() => remoteDataSource.createUser
              (createdAt:  any(named: 'createdAt'),
                name: any(named: 'name'),
                avatar: any(named: 'avatar')
  
            )).thenThrow( const ServerException(message: 'Server Failure', statusCode: 500, ));
            const  createdAt = 'testcreatedAt';
            const  name = 'testname';
            const  avatar = 'testavatar';
  
            // act
            final result = await authenticationRepositoryImplementation.createUser(createdAt: 'createdAt', name: 'name', avatar: 'avatar');
            // assert
            expect(result, equals(const Left(ServerFailure(message: 'Server Failure', statusCode: 500, ))));
            verify(
                    () => remoteDataSource.createUser(createdAt: 'createdAt', name: 'name', avatar: 'avatar')
            ).called( 1);
            verifyNoMoreInteractions( remoteDataSource);
          });

  }

