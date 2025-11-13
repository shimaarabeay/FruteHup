import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_tex_field.dart';
import '../../../../../core/widgets/password_field.dart';
import 'have_an_account_widget.dart';
import 'terms_and_conditions.dart';


class SignupViewBody extends StatefulWidget {
 const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
 final GlobalKey<FormState> formKey =GlobalKey<FormState>();
   AutovalidateMode autovalidateMode =AutovalidateMode.disabled;
  late String  email, password ,userName;
  @override
  Widget build(BuildContext context) {
    return
     SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16),
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      onSaved: (value) {
                        userName = value!;
                      },
                      hintText: 'الاسم كامل',
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                      onSaved: (value) {
                         email =value!;
                      },
                      hintText: 'البريد الإلكتروني',
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 16,
                  ),
                  PasswordField(
                    onSaved: (value) {
                      password =value!;

                    },

                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TermsAndConditionsWidget(
                    onChanged: (val) {
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onPressed: () {
                     if(formKey.currentState!.validate()){
                       formKey.currentState!.save();
                       context.read<SignupCubit>().createUserWithEmailAndPassword(email, password, userName);
                     }else{
                       setState(() {
                         autovalidateMode =AutovalidateMode.always;
                       });
                     }
                      }
                   ,
                    text: 'إنشاء حساب جديد',
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  const HaveAnAccountWidget(),
                ],
              ),
            ),
          ),

    );
  }
}