part of '../result_view.dart';

class _ScanResult extends StatelessWidget {
  const _ScanResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = QrCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (state is QrResultLoading) {
          return SizedBox(
            height: context.height / 3,
            child: const LoadingIndicator(),
          );
        }
        if (state is QrResultLoaded) {
          return SizedBox(
            height: context.height / 2.5,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.scanResult.scanData.length,
              itemBuilder: (context, index) {
                return ScanResultTile(
                  scanData: state.scanResult.scanData[index],
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: context.height / 3,
            child: const Center(child: Text('no Data')),
          );
        }
      },
    );
  }
}

class ScanResultTile extends StatelessWidget {
  const ScanResultTile({
    Key? key,
    required this.scanData,
  }) : super(key: key);

  final ScanModel scanData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4).r,
      margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8).r,
      decoration: BoxDecoration(
          color: ColorManager.lightGrey,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          IconAssets.file,
          width: 30,
          height: 30,
        ),
        title: Text(
          scanData.code,
          style: getRegularStyle(color: Colors.black, fontSize: 12.sp),
        ),
      ),
    );
  }
}
