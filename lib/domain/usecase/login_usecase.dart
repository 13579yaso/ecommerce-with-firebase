import 'package:firebase_auth/firebase_auth.dart';


import '../repository/auth_repository.dart';

class LoginUseCase{
  final AuthRepository repoImpl;

  LoginUseCase(this.repoImpl);

  Future<UserCredential?> loginUseCase(String email , String password){
    return repoImpl.signIn(email: email, password: password);
  }

}