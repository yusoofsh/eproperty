import 'package:auto_route/auto_route.dart';
import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    @required this.attribute,
    @required this.labelText,
    this.obscureText,
    this.autoCorrect,
    this.suffixIcon,
    this.keyboardType,
    this.autoValidateMode,
    this.validators,
    Key key,
  }) : super(key: key);

  final String attribute;
  final String labelText;
  final bool obscureText;
  final bool autoCorrect;
  final Icon suffixIcon;
  final TextInputType keyboardType;
  final AutovalidateMode autoValidateMode;
  final List<FormFieldValidator> validators;

  @override
  Widget build(_) {
    return FormBuilderTextField(
      attribute: attribute,
      obscureText: obscureText ?? false,
      autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
      autocorrect: autoCorrect ?? true,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: CustomStyles.customTextStyle(),
        hintStyle: CustomStyles.customTextStyle(),
        border: CustomBorders.customOutlineInputBorder(),
        enabledBorder: CustomBorders.customOutlineInputBorder(),
        suffixIcon: suffixIcon,
      ),
      validators: validators,
    );
  }
}
