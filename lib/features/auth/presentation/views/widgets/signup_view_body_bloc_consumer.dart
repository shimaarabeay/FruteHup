import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/build_error_bar.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import '../../cubits/signup_cubit/signup_state.dart';
import 'signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SuccessState) {
        }
        else if (state is FailureState) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is LoadingState ? true : false,
            child: const SignupViewBody());
      },
    );
  }


}
