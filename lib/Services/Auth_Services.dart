import 'package:firebase_auth/firebase_auth.dart';

class AuthServices
{
  AuthServices._();
  static AuthServices authServices=AuthServices._();

   final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

   Future<void> createAccount(String email,String password)
   async {
    await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
   }

   Future<void> signInAccount(String email,String password)
   async {
     await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
   }

   Future<void> signOutAcc()
   async {
     await firebaseAuth.signOut();
   }

   String? getCurrentUser()
   {
     User? user=firebaseAuth.currentUser;
     return user!.email;
   }
}