import 'package:facebook_clone_app/core/models/user_model.dart';
import 'package:facebook_clone_app/features/profile/repositories/profile_repository.dart';

class ProfileController {
  final ProfileRepository _repository = ProfileRepository();

  Future<UserModel?> getUserData(String uid) async {
    return _repository.getUserData(uid);
  }
}
