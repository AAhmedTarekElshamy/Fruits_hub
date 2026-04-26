
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/features/auth/domain/entities/user_entity.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService{
Future<User> createUserWithEmailAndPassword(String email, String password,  ) async  {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email ,
      password: password,
    );
    return credential.user!;
  } on FirebaseAuthException catch (e) {
    log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} and code is ${e.code}');
    if (e.code == 'weak-password') {
      throw CustomException(message: "weak_password".tr(), );
     // print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
     throw CustomException(message: "account_already_exists".tr(), );
      // print('The account already exists for that email.');
    }else if (e.code == 'network-request-failed') {
      throw CustomException(message: "no_internet_connection".tr());

    }
    else{
      throw CustomException(message: "Something_went_wrong".tr(), );
    }
  } catch (e) {
    log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} ');
    throw CustomException(message:"Something_went_wrong".tr(), );
    //print(e);
  }

}

}