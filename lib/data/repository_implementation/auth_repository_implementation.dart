import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/auth_repository.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/create_profile_service.dart';


class AuthRepositoryImplementation implements AuthRepository{
  @override
  Future<bool> createProfile(UserModel model)async {
    try {
      final userCredentialResult = await CreateProfileService.createProfile(model);
      return true;
    }catch(e){
      print(e.toString());
      return false;
    }
  }

  @override
  Future<UserCredential?> signIn({required String email, required String password}) async{
    try {
      final userCredentialResult = await AuthService.signIn(email, password);
      return userCredentialResult;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  @override
  Future<UserCredential?> signUp({required String email, required String password}) async{
    try {
      final userCredentialResult = await AuthService.signUp(email, password);
      return userCredentialResult;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}