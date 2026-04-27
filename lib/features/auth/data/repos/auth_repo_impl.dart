import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fruits_hub/core/errors/failures.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure("Something_went_wrong".tr()));
    }
  }


  @override
  Future<Either<Failure, UserEntity>> signInUserWithEmailAndPassword(String email, String password) async{


    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email, password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailure("Something_went_wrong".tr()));
    }



  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle()async {
 try {
   var user = await firebaseAuthService.signInWithGoogle();
   return right(UserModel.fromFirebaseUser(user));
   }  catch (e) {
   log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
 }  return left(ServerFailure("Something_went_wrong".tr()));
  }
}
