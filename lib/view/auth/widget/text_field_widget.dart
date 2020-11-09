import 'package:auto_route/auto_route.dart';
import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    @required this.attribute,
    @required this.labelText,
    this.autovalidateMode,
    this.obscureText,
    this.validators,
    this.suffixIcon,
    Key key,
  }) : super(key: key);

  final String attribute;
  final String labelText;
  final bool obscureText;
  final Icon suffixIcon;
  final AutovalidateMode autovalidateMode;
  final List<FormFieldValidator> validators;

  @override
  Widget build(_) {
    return FormBuilderTextField(
      attribute: attribute,
      obscureText: obscureText ?? false,
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
