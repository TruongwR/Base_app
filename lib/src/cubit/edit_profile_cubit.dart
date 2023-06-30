import 'package:Whispers/src/cubit/edit_profile_state.dart';
import 'package:Whispers/src/data/repositories/repository/authentication_repository.dart';
import 'package:Whispers/src/navigator/app_navigator.dart';
import 'package:Whispers/src/navigator/routers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final AuthenticationRepository authen;
  EditProfileCubit({required this.authen}) : super(const EditProfileState.initial());

  Future<void> updateProfile(
      {String? firstName, String? lastName, String? passwordOld, String? password, String? avatarFileId}) async {
    emit(const EditProfileState.loading());
    final repo = await authen.updateProfile(
        firstName: firstName,
        lastName: lastName,
        passwordOld: passwordOld,
        password: password,
        avatarFileId: avatarFileId);
    if (repo.success == true) {
      var userInfor = await Hive.openBox('tbl_user');
      userInfor.put('passWord', password);
      userInfor.put('firstName', firstName);
      userInfor.put('lastName', lastName);
      userInfor.put('avatarFileId', avatarFileId);
      emit(const EditProfileState.succes());
    } else {
      AppNavigator.push(Routes.editProfileScreen);
      emit(const EditProfileState.failure('Chỉnh sửa thất bại'));
    }
  }
}
