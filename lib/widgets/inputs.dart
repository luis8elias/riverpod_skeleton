import 'package:flutter/material.dart';

class BasicInput extends StatelessWidget {
  const BasicInput({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText
  });

  final String label;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      cursorColor: Theme.of(context).primaryColor,
      style: const TextStyle(
        fontSize: 16
      ),
      decoration:  InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(8),
        labelText: label,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).primaryColorDark
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColorDark.withOpacity(0.5),
          fontSize: 16
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark.withOpacity(0.2)
          ),
        ),
        focusedBorder:  UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDark
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: validator,
    );
  }
}