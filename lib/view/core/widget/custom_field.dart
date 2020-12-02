import 'package:eproperty/value/borders.dart';
import 'package:eproperty/value/styles.dart';
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
    this.suffix,
    this.suffixIcon,
    this.textStyle,
    this.validator,
  });

  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final String hintText;
  final String labelText;
  final String name;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final ValueChanged<String> onChanged;
  final Widget suffix;
  final Widget suffixIcon;
  final bool obscureText;

  @override
  FormBuilderTextField build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      name: name,
      obscureText: obscureText,
      onChanged: onChanged,
      style: textStyle,
      validator: validator,
      decoration: decoration(
        labelText: labelText,
        hintText: hintText,
        suffix: suffix,
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
    this.autovalidateMode,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.suffix,
    this.suffixIcon,
    this.textStyle,
    this.validator,
  });

  final AutovalidateMode autovalidateMode;
  final FormFieldValidator validator;
  final List<DropdownMenuItem> items;
  final String hintText;
  final String labelText;
  final String name;
  final TextStyle textStyle;
  final ValueChanged onChanged;
  final VoidCallback onTap;
  final Widget suffix;
  final Widget suffixIcon;

  @override
  FormBuilderDropdown build(BuildContext context) {
    return FormBuilderDropdown(
      autovalidateMode: autovalidateMode ?? AutovalidateMode.onUserInteraction,
      items: items,
      name: name,
      onChanged: onChanged,
      onTap: onTap,
      style: textStyle,
      validator: validator,
      decoration: decoration(
        labelText: labelText,
        suffix: suffix,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}

InputDecoration decoration({
  @required String labelText,
  String hintText,
  Widget suffix,
  Widget suffixIcon,
}) {
  return InputDecoration(
    border: Borders.customOutlineInputBorder(),
    enabledBorder: Borders.customOutlineInputBorder(),
    hintStyle: Styles.customTextStyle(),
    hintText: hintText,
    labelStyle: Styles.customTextStyle(),
    labelText: labelText,
    suffix: suffix,
    suffixIcon: suffixIcon,
  );
}
