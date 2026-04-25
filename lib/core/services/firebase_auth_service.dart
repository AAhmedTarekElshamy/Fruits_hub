
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
    if (e.code == 'weak-password') {
      throw CustomException(message: 'The password provided is too weak.', );
     // print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
     throw CustomException(message: 'The account already exists for that email.', );
      // print('The account already exists for that email.');
    }else{
      throw CustomException(message: 'Something went wrong', );
    }
  } catch (e) {
    throw CustomException(message:'Something went wrong', );
    //print(e);
  }

}

}