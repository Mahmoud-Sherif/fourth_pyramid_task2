part of '../result_view.dart';

class _SentBTN extends StatelessWidget {
  const _SentBTN({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = QrCubit.of(context);
    return Column(
      children: [
        SizedBox(height: 30.h),
        MainButton(
          text: 'Send',
          onPressed: cubit.getScans,
        )
      ],
    );
  }
}
