import 'package:base_app/src/cubit/edit_profile_state.dart';
import 'package:base_app/src/data/repositories/repository/authentication_repository.dart';
import 'package:base_app/src/navigator/app_navigator.dart';
import 'package:base_app/src/navigator/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AuthenticationRepository authen;
  EditProfileCubit({required this.authen}) : super(const EditProfileState.initial());

  Future<void> updateProfile(
      {required String firstName,
      required String lastName,
      required String passwordOld,
      required String password,
      required String avatarFileId}) async {
    emit(const EditProfileState.loading());
    final repo = await authen.updateProfile(firstName, lastName, passwordOld, password, avatarFileId);
    if (repo.success == true) {
      var userInfor = await Hive.openBox('tbl_user');
      userInfor.put('passWord', password);
      AppNavigator.push(Routes.profileScreen);
      emit(const EditProfileState.succes());
    } else {
      AppNavigator.push(Routes.editProfileScreen);
      emit(const EditProfileState.failure('Chỉnh sửa thất bại'));
    }
    // EditProfile editProfile = EditProfile.fromJson(repo.);
  }
}
