import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthentication {
  static Future<User?> signInUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Not existing email');
      } else if (e.code == 'wrong-password') {
        print('Password incorrect');
      }
    }
    return user;
  }

  static Future<User?> singUpUsingEmailAndPass({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;

      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      //
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('Warning: Weak password!');
      } else if (e.code == 'email-already-in-use') {
        print('Error: Email already in use.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
