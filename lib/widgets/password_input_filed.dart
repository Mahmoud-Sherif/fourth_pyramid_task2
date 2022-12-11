import 'package:flutter/material.dart';
import 'package:fourth_pyramid_task2/core/utils/color_manager.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    Key? key,
    this.hint,
    this.margin = const EdgeInsets.symmetric(vertical: 8),
    this.validator,
    this.onSaved,
  }) : super(key: key);

  final String? hint;
  final EdgeInsetsGeometry? margin;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  @override
  void initState() {
    _passwordVisible = false;
  }

  late bool _passwordVisible;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(12, 26),
              blurRadius: 50,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.1)),
        ],
      ),
      child: TextFormField(
        onSaved: widget.onSaved,
        validator: widget.validator,
        obscureText: !_passwordVisible,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
            child: Icon(
              _passwordVisible
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
              color: ColorManager.grey,
              size: 18,
            ),
          ),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: ColorManager.grey),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.outline, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.orange, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.error, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.outline, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}
