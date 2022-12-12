part of '../scan_view.dart';

class _ScanBTN extends StatelessWidget {
  const _ScanBTN({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = QrCubit.of(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return state is QrScanLoading
            ? const LoadingIndicator()
            : MainButton(
                text: 'Scan',
                onPressed: cubit.postScans,
              );
      },
    );
  }
}
