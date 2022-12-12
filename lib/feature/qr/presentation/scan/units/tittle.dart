part of '../scan_view.dart';

class _Tittle extends StatelessWidget {
  const _Tittle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: InkWell(
            child: SvgPicture.asset(IconAssets.icon1),
            onTap: () => MagicRouter.navigateTo(const ResultView()),
          ),
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
            style:
                getBoldStyle(color: ColorManager.onBackGround, fontSize: 12.sp),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}
