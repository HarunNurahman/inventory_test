import 'package:flutter/material.dart';
import 'package:inventory_test/shared/styles.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final String Function(String?)? validator;
  final TextEditingController? controller;
  final String Function(String?)? onChanged;
  final String Function(String?)? onFieldSubmitted;
  final TextInputType keyboardType;
  final String hintText;
  final String? errorMessage;
  const CustomTextForm({
    super.key,
    required this.labelText,
    this.validator,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$labelText*',
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType,
          style: blackTextStyle.copyWith(fontWeight: medium),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: grayTextStyle,
            errorText: errorMessage,
            errorStyle: redTextStyle.copyWith(fontSize: 12, fontWeight: medium),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: lightGrayColor),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightGrayColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: lightGrayColor),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: redColor),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: redColor),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
