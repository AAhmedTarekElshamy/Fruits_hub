import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {

  Future deleteUserData() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }


  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(
          message: "weak_password".tr(),
        );
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: "account_already_exists".tr(),
        );
        // print('The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "no_internet_connection".tr());
      } else {
        throw CustomException(
          message: "Something_went_wrong".tr(),
        );
      }
    } catch (e) {
      log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} ');
      throw CustomException(
        message: "Something_went_wrong".tr(),
      );
      //print(e);
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} and code is ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException(
          message: "weak_password".tr(),
        );
        // print('The password provided is too weak.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: "no_internet_connection".tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: "wrong_password_or_email".tr(),
        );
      } else if (e.code == 'user-not-found') {
        throw CustomException(
          message: "wrong_password_or_email".tr(),
        );
      }
      else {
        throw CustomException(
          message: "Something_went_wrong".tr(),
        );
      }
    } catch (e) {
      log('Exception in FirebaseAuthException.createUserWithEmailAndPassword : ${e.toString()} ');
      throw CustomException(
        message: "Something_went_wrong".tr(),
      );
      //print(e);
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return ( await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }


  Future<User> signInWithFacebook() async {
    final LoginResult loginResult =
    await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(
      loginResult.accessToken!.tokenString,
    );

    return (await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential))
        .user!;
  }



  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential)).user!;

  }




}
