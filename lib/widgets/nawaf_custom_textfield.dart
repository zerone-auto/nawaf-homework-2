import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/nawaf_colors.dart';

class NawafCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLines;

  const NawafCustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    this.validator,
    required this.keyboardType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(
        color: NawafColors.textColor,
        fontFamily: 'Cairo',
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: NawafColors.labelColor,
          fontFamily: 'Cairo',
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NawafColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NawafColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NawafColors.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: NawafColors.errorColor),
        ),
        filled: true,
        fillColor: NawafColors.inputBackgroundColor,
      ),
    );
  }
}
