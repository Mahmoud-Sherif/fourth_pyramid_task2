import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fourth_pyramid_task2/config/routes/magic_router.dart';
import 'package:fourth_pyramid_task2/core/utils/assets_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/color_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/media_query_values.dart';
import 'package:fourth_pyramid_task2/core/utils/styles_manager.dart';
import 'package:fourth_pyramid_task2/feature/qr/cubit/qr_cubit.dart';
import 'package:fourth_pyramid_task2/feature/qr/presentation/result/result_view.dart';
import 'package:fourth_pyramid_task2/widgets/loading_indicator.dart';
import 'package:fourth_pyramid_task2/widgets/main_button.dart';
part 'units/qr_scan.dart';
part 'units/scan_btn.dart';
part 'units/tittle.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCubit(),
      child: Scaffold(
        backgroundColor: ColorManager.lightBlack,
        appBar: AppBar(
          backgroundColor: ColorManager.lightBlack,
        ),
        body: DraggableScrollableSheet(
          initialChildSize: 1,
          minChildSize: .5,
          maxChildSize: 1,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                children: const [
                  _Tittle(),
                  _QrScan(),
                  _ScanBTN(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
