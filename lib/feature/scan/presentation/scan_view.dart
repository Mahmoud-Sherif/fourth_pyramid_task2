import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourth_pyramid_task2/core/utils/assets_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/color_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/media_query_values.dart';
import 'package:fourth_pyramid_task2/core/utils/styles_manager.dart';
import 'package:fourth_pyramid_task2/widgets/main_button.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.lightBlack,
      appBar: AppBar(
        backgroundColor: ColorManager.lightBlack,
      ),
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Container(
                  height: 4.h,
                  width: context.width / 6,
                  decoration: BoxDecoration(
                      color: ColorManager.grey.withOpacity(.25),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  margin: const EdgeInsets.symmetric(vertical: 16).r,
                ),
                Align(
                  widthFactor: 8,
                  alignment: Alignment.bottomRight,
                  child: SvgPicture.asset(IconAssets.icon1),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Scan QR code',
                  style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70).r,
                  child: Text(
                    'Place qr code inside the frame to scan please avoid shake to get results quickly',
                    style: getBoldStyle(
                        color: ColorManager.onBackGround, fontSize: 12.sp),
                  ),
                ),
                SizedBox(height: 30.h),
                SvgPicture.asset(
                  ImageAssets.qr,
                  width: 140.w,
                  height: 140.h,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Scanning Code...',
                  style: getBoldStyle(
                      color: ColorManager.onBackGround, fontSize: 12.sp),
                ),
                SizedBox(height: 30.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.collections_outlined),
                    SizedBox(width: 12.w),
                    SvgPicture.asset(IconAssets.icon3),
                    SizedBox(width: 12.w),
                    const Icon(Icons.flash_on_outlined),
                  ],
                ),
                SizedBox(height: 30.h),
                MainButton(
                  text: 'Place Camera Code',
                  onPressed: () {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
