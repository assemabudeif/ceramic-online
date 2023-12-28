import '/core/global/theme/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.inputFormatters,
    required this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.readOnly = false,
    this.suffix,
  });

  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool readOnly;
  final List<TextInputFormatter> inputFormatters;
  final Function(String?) validator;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Function(String?)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      validator: (value) => validator(value),
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!(value);
        }
      },
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: InputBorder.none,
          suffix: suffix,
          enabledBorder: const UnderlineInputBorder(),
          focusedBorder: const UnderlineInputBorder(),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorColor,
            ),
          ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kErrorColor,
            ),
          ),
          filled: false),
    );
  }
}
