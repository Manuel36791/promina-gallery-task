// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pro_mina_task/presentation/managers/values_manager.dart';

import '../managers/colors_manager.dart';

class CustomFormField extends StatelessWidget {
  final controller,
      isSecure,
      hint,
      validator,
      onChanged,
      initialValue,
      maxLines,
      minLines,
      keyboardType;

  const CustomFormField({
    Key? key,
    this.controller,
    this.hint,
    this.isSecure = false,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: isSecure,
      validator: validator,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: PaddingManager.p15),
        hintText: hint,
        filled: true,
        fillColor: ColorsManager.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeManager.s22),
          borderSide: const BorderSide(color: ColorsManager.white),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
