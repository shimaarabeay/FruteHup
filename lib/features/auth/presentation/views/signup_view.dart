import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../../../core/services/git_it_services.dart';

import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signupView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'حساب جديد',
          ),
        ),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }


}
