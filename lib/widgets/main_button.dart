import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourth_pyramid_task2/core/utils/color_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/styles_manager.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = 300,
    this.borderRadius = 50,
    this.height = 50,
    this.elevation = 0,
  });
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: width!.w,
      height: height!.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: getBoldStyle(color: ColorManager.white, fontSize: 16),
          backgroundColor: ColorManager.orange,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
