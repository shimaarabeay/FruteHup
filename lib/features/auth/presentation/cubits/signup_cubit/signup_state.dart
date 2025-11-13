import 'package:fruit_app/features/auth/domain/entities/user_entity.dart';

class SignupState {}

class InitialState extends SignupState {}

class LoadingState extends SignupState {}

class FailureState extends SignupState {
  final String message;

  FailureState({required this.message});
}

class SuccessState extends SignupState {
  final UserEntity userEntity;

  SuccessState({required this.userEntity});
}
