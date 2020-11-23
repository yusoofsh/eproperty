import 'package:auto_route/auto_route.dart';
import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BuildField extends StatelessWidget {
  const BuildField({
    @required this.type,
    @required this.attribute,
    @required this.labelText,
    this.obscureText,
    this.autoCorrect,
    this.suffixIcon,
    this.keyboardType,
    this.validators,
    this.items,
    Key key,
  }) : super(key: key);

  final String type;
  final String attribute;
  final String labelText;
  final bool obscureText;
  final bool autoCorrect;
  final Icon suffixIcon;
  final TextInputType keyboardType;
  final List<FormFieldValidator> validators;
  final List<DropdownMenuItem<dynamic>> items;

  @override
  Widget build(_) {
    switch (type) {
      case 'text':
        return FormBuilderTextField(
          attribute: attribute,
          obscureText: obscureText ?? false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autocorrect: autoCorrect ?? true,
          keyboardType: keyboardType,
          validators: validators,
          decoration: decoration(),
        );
      case 'drop':
        assert(items != null, 'Fill the items.');

        return FormBuilderDropdown(
          attribute: attribute,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          items: items,
          decoration: decoration(),
        );
      default:
        return const Center(child: Text('lol'));
    }
  }

  InputDecoration decoration() {
    return InputDecoration(
      labelText: labelText,
      labelStyle: CustomStyles.customTextStyle(),
      hintStyle: CustomStyles.customTextStyle(),
      border: CustomBorders.customOutlineInputBorder(),
      enabledBorder: CustomBorders.customOutlineInputBorder(),
      suffixIcon: suffixIcon,
    );
  }
}
