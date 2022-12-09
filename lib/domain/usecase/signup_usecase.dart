import 'package:firebase_auth/firebase_auth.dart';


import '../repository/auth_repository.dart';

class SignupUseCase{
  AuthRepository repoImpl ;
  SignupUseCase({required this.repoImpl});

  Future<UserCredential?> signupUseCase(String email,String password){
    return repoImpl.signUp(email: email, password: password);
  }
}