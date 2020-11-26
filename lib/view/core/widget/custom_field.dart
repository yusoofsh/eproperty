import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    @required this.hintText,
    @required this.labelText,
    @required this.name,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.textStyle,
    this.validators,
  });

  final bool obscureText;
  final Icon suffixIcon;
  final List<FormFieldValidator> validators;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final String labelText;
  final String name;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      name: name,
      obscureText: obscureText,
      onChanged: onChanged,
      style: textStyle,
      validator: FormBuilderValidators.compose(
        validators,
      ),
      decoration: decoration(
        hintText,
        labelText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    @required this.hintText,
    @required this.items,
    @required this.labelText,
    @required this.name,
    this.onChanged,
    this.suffixIcon,
    this.textStyle,
    this.validators,
  });

  final Icon suffixIcon;
  final List<DropdownMenuItem<dynamic>> items;
  final List<FormFieldValidator> validators;
  final String hintText;
  final String labelText;
  final String name;
  final TextStyle textStyle;
  final ValueChanged onChanged;

  @override
  FormBuilderDropdown build(BuildContext context) {
    return FormBuilderDropdown(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: items,
      name: name,
      onChanged: onChanged,
      style: textStyle,
      decoration: decoration(
        hintText,
        labelText,
        suffixIcon: suffixIcon,
      ),
      validator: FormBuilderValidators.compose(
        validators,
      ),
    );
  }
}

InputDecoration decoration(
  String hintText,
  String labelText, {
  Widget suffixIcon,
}) {
  return InputDecoration(
    border: Borders.customOutlineInputBorder(),
    enabledBorder: Borders.customOutlineInputBorder(),
    hintStyle: Styles.customTextStyle(),
    labelStyle: Styles.customTextStyle(),
    hintText: hintText,
    labelText: labelText,
    suffixIcon: suffixIcon,
  );
}
