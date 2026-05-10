import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/backend_endpoint.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
        user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity  = UserEntity(id: user.uid, email: email, name: name);    //UserModel.fromFirebaseUser(user);
      await addUserData(user:userEntity);

      return right(userEntity);
    } on CustomException catch (e) {
      if(user !=null)  {
       await firebaseAuthService.deleteUserData();
      }
      return left(ServerFailure(e.message));

    } catch (e) {
      if(user !=null)  {
        await firebaseAuthService.deleteUserData();
      }
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure("Something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);
      var userEntity = await getUserData(uId: user.uid);
      return
       right(userEntity);
       // right(UserModel.fromFirebaseUser(user));

    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure("Something_went_wrong".tr()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
 User? user;
    try {
        user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      if((await databaseService.checkIfDataExists(path: BackendEndpoint.ifUserExists, uId: userEntity.id))){
        await getUserData(uId: user.uid);
      }else{
        await  addUserData( user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if(user !=null)  {
        await firebaseAuthService.deleteUserData();
      }
      firebaseAuthService.deleteUserData();
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
    }
    return left(ServerFailure("Something_went_wrong".tr()));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithFacebook();

      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.ifUserExists,
        uId: userEntity.id,
      );

      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUserData();
      }

      log(
        'Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}',
      );
    }

    return left(ServerFailure("Something_went_wrong".tr()));
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithApple();

      final userEntity = UserModel.fromFirebaseUser(user);

      final isUserExists = await databaseService.checkIfDataExists(
        path: BackendEndpoint.ifUserExists,
        uId: userEntity.id,
      );

      if (isUserExists) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUserData();
      }

      log(
        'Exception in AuthRepoImpl.signInWithApple : ${e.toString()}',
      );
    }

    return left(ServerFailure("Something_went_wrong".tr()));
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {

    await databaseService.addData(path: BackendEndpoint.addUserData, data: user.toMap(),documentId: user.id);
  }

  @override
  Future<UserEntity> getUserData({required uId}) async {
    return UserModel.fromJson(await databaseService.getData(path: BackendEndpoint.getUserData, uId: uId));

  }

}
