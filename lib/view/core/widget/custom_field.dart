import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    @required this.labelText,
    @required this.name,
    this.autovalidateMode,
    this.hintText,
    this.inputFormatters,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.suffixIcon,
    this.textStyle,
    this.validators,
  });

  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<String> validators;
  final Icon suffixIcon;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final String labelText;
  final String name;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final ValueChanged<String> onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      name: name,
      obscureText: obscureText,
      onChanged: onChanged,
      style: textStyle,
      validator: validators,
      decoration: decoration(
        labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    @required this.items,
    @required this.labelText,
    @required this.name,
    this.hintText,
    this.onChanged,
    this.onTap,
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
  final VoidCallback onTap;

  @override
  FormBuilderDropdown build(BuildContext context) {
    return FormBuilderDropdown(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: items,
      name: name,
      onChanged: onChanged,
      onTap: onTap,
      style: textStyle,
      decoration: decoration(
        labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
      validator: FormBuilderValidators.compose(
        validators,
      ),
    );
  }
}

InputDecoration decoration(
  String labelText, {
  String hintText,
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
