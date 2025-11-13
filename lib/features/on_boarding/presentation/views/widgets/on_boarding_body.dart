import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/app_colors.dart';

import '../../../../../core/constant.dart';
import '../../../../../core/services/shared_preferences/shared_preferences_singleton.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        OnBoardingPageView(pageController: pageController),
        DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: currentPage == 1
                  ? AppColors.primaryColor
                  : AppColors.primaryColor.withOpacity(.5),
            )),
        SizedBox(
          height: 10,
        ),
        Visibility(
          maintainSize: true,
          maintainState: true,
          maintainAnimation: true,
          visible: currentPage==1?true:false,
          //(pageController.hasClients?pageController.page!.round():0)==0?false:true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomButton(
              onPressed: () {
                SharedPreferencesSingleton.setBool(isOnboardingView, true);
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);
              },
              text: 'ابدأ الا',
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    ));
  }
}
