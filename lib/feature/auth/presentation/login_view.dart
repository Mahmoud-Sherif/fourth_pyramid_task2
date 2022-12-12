import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fourth_pyramid_task2/config/validator/validator.dart';
import 'package:fourth_pyramid_task2/core/utils/color_manager.dart';
import 'package:fourth_pyramid_task2/core/utils/styles_manager.dart';
import 'package:fourth_pyramid_task2/feature/auth/cubit/auth_cubit.dart';
import 'package:fourth_pyramid_task2/widgets/arc.dart';
import 'package:fourth_pyramid_task2/widgets/custom_input_filed.dart';
import 'package:fourth_pyramid_task2/widgets/main_button.dart';
import 'package:fourth_pyramid_task2/widgets/password_input_filed.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            MyArc(
              diameter: 400.w,
              adjust: 3,
            ),
            MyArc(
              diameter: 350.w,
              adjust: 1,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20).r,
                  child: Column(
                    children: const [
                      Title(),
                      Fields(),
                      Buttons(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, bottom: 100).r,
      child: Text(
        'Login',
        style: getBoldStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.of(context);
    return Column(
      children: [
        SizedBox(height: 8.h),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(ColorManager.grey)),
            onPressed: () {},
            child: const Text('Forgot Password ?'),
          ),
        ),
        SizedBox(height: 24.h),
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return state is LoginLoading
                ? const CircularProgressIndicator(
                    color: ColorManager.orange,
                  )
                : MainButton(
                    text: 'Login',
                    onPressed: cubit.login,
                  );
          },
        )
      ],
    );
  }
}

class Fields extends StatelessWidget {
  const Fields({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cubit = AuthCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomInputField(
            hint: 'Enter your phone',
            validator: Validator.phoneNumber,
            onSaved: (phoneNumber) => cubit.phone = phoneNumber!,
          ),
          PasswordInputField(
            hint: 'Password',
            validator: Validator.password,
            onSaved: (password) => cubit.password = password!,
          ),
        ],
      ),
    );
  }
}
