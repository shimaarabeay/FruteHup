import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../gen/assets.gen.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(

        child: PageView(
          controller: pageController,
          children: [
          PageViewItem(
            image: Assets.images.pageViewItem1Image,
            backgroundImage: Assets.images.pageViewItem1BackgroundImage,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'مرحبًا بك في',
                  style: TextStyles.bold23,
                ),
                Text(
                  '  HUB',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                Text(
                  'Fruit',
                  style: TextStyles.bold23.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            subTitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            isVisible: true),
                //(pageController.hasClients?pageController.page!.round():0)==0?true:false,)

          PageViewItem(
            image: Assets.images.pageViewItem2Image,
            backgroundImage: Assets.images.pageViewItem2BackgroundImage,
            title: Text(
              'ابحث وتسوق',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0C0D0D),
                fontSize: 23,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            subTitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            isVisible:false
                //(pageController.hasClients?pageController.page!.round():0)!=0? false: true
          ),
        ],
    ));
  }
}
