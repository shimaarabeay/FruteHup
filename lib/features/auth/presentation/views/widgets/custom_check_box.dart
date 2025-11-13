import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../core/utils/app_colors.dart';
import '../../../../../gen/assets.gen.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onPress, });
  final bool isChecked;
   final ValueChanged<bool>onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      onPress(!isChecked);
      },
      child: AnimatedContainer(
          width: 24,
          height: 24,
          duration: const Duration(milliseconds: 100),
          decoration: ShapeDecoration(
            color: isChecked ? AppColors.primaryColor
                : Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.50,
                color: isChecked ? Colors.transparent : const Color(0xFFDCDEDE),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: isChecked
              ? Padding(
            padding: const EdgeInsets.all(2),
            child: SvgPicture.asset(
              Assets.images.check,
            ),
          )
              : const SizedBox(),
      ),
    );
  }
}