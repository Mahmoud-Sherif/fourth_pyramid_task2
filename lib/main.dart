import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourth_pyramid_task2/feature/auth/presentation/login_view.dart';
import 'config/routes/magic_router.dart';
import 'config/theme/theme.dart';
import 'feature/auth/data/localdata/auth_local_data.dart';
import 'feature/qr/presentation/scan/scan_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 699),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme(),
          home: LoginView(),
          // home: AppStorage.isLogged ? const ScanView() : const LoginView(),

          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
