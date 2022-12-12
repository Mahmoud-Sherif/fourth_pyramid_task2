part of '../scan_view.dart';

class _QrScan extends StatelessWidget {
  const _QrScan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = QrCubit.of(context);
    return Column(
      children: [
        // BlocBuilder(
        //   bloc: cubit,
        //   builder: (context, state) {
        // if (state is QrScanLoading) {
        // return SizedBox(
        //   width: 200,
        //   height: 200,
        //   child: QRView(
        //     key: cubit.qrKey,
        //     onQRViewCreated: cubit.onQRViewCreated,
        //     overlay: QrScannerOverlayShape(

        //       borderColor: Colors.orange,
        //       borderRadius: 10,
        //       borderLength: 30,
        //       borderWidth: 10,
        //       cutOutSize: 250,
        //     ),
        //   ),
        // );
        // }
        SvgPicture.asset(
          ImageAssets.qr,
          width: 140.w,
          height: 140.h,
        ),
        //     ;
        //   },
        // ),
        SizedBox(height: 10.h),
        Text(
          'Scanning Code...',
          style:
              getBoldStyle(color: ColorManager.onBackGround, fontSize: 12.sp),
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
      ],
    );
  }
}
