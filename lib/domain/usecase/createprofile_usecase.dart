
import '../../data/models/user_model.dart';
import '../repository/auth_repository.dart';

class CreateProfileUseCase{
  AuthRepository repoImpl;

  CreateProfileUseCase({required this.repoImpl});

  Future<bool> createProfileUseCase(UserModel user){
    return repoImpl.createProfile(user);
  }
}