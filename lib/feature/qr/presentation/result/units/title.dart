part of '../result_view.dart';

class _Title extends StatelessWidget {
  const _Title({
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
            child: SvgPicture.asset(IconAssets.icon2),
            onTap: () => MagicRouter.pop(),
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          'Scanning Result',
          style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70).r,
          child: Text(
            'Proreader will Keep your last 10 days history to keep your all scared history please purched our pro package',
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
