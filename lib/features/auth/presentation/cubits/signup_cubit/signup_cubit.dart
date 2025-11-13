import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState>{

  final AuthRepo authRepo;

  SignupCubit( this.authRepo):super( InitialState());
  Future<void>createUserWithEmailAndPassword(String email,String password,String name)async{

    var result = await authRepo.createUserWithEmailAndPassword(email, password, name);

    result.fold(
            (failure)=>emit(FailureState(message: failure.message)),
            (userEntity)=>emit(SuccessState(userEntity: userEntity))
    );
  }
}