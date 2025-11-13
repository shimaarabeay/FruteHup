import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_app/features/auth/presentation/views/login_view.dart';
import 'package:fruit_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit_app/gen/assets.gen.dart';
import '../../../../../core/constant.dart';
import '../../../../../core/services/shared_preferences/shared_preferences_singleton.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.images.plant),
          ],
        ),
        SvgPicture.asset(Assets.images.logo),
        SvgPicture.asset(
          Assets.images.splashBottom,
          fit: BoxFit.fill,
        )
      ],
    );
  }
  void executeNavigation() {
    bool isOnboardingViewSeen= SharedPreferencesSingleton.getBool(isOnboardingView);
    Future.delayed(const Duration(seconds: 1), () {
      if (isOnboardingViewSeen == true) {
        return Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        return Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
