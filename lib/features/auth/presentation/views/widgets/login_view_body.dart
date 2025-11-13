import 'package:flutter/material.dart';
import 'package:fruit_app/core/widgets/custom_button.dart';
import 'package:fruit_app/core/widgets/custom_tex_field.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../gen/assets.gen.dart';
import 'dont_have_account_widget.dart';
import 'or_driver.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(title: 'تسجيل الدخول', ''),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              SizedBox(height: 24),
              CustomTextFormField(
                  hintText: 'البريد الالكترونى',
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: 16),
              CustomTextFormField(
                textInputType: TextInputType.visiblePassword,
                hintText: 'كلمة المرور',
                suffixIcon: Icon(Icons.visibility_outlined),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'هل نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {},
                text: 'تسجيل الدخول',
              ),
              SizedBox(
                height: 16,
              ),
              const DontHaveAnAccountWidget(),
              SizedBox(
                height: 16,
              ),
              const OrDivider(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  // context.read<SigninCubit>().signinWithGoogle();
                },
                image: Assets.images.googleIcon,
                title: 'تسجيل بواسطة جوجل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  // context.read<SigninCubit>().signinWithApple();
                },
                image: Assets.images.applIcon,
                title: 'تسجيل بواسطة أبل',
              ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  // context.read<SigninCubit>().signinWithFacebook();
                },
                image: Assets.images.facebookIcon,
                title: 'تسجيل بواسطة فيسبوك',
              ),
            ]),
          ),
        ));
  }
}
