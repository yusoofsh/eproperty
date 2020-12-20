import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_field.dart';
import 'package:eproperty/view_model/dashboard_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeView extends StatefulWidget {
  @override
  _ChangeViewState createState() => _ChangeViewState();
}

class _ChangeViewState extends State<ChangeView> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            FeatherIcons.x,
            color: Colors.black,
          ),
          onPressed: () => context.navigator.pop(),
        ),
        backgroundColor: Colors.background,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          Strings.changePassword,
          style: context.textTheme.headline6,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              FeatherIcons.check,
              color: Colors.black,
            ),
            onPressed: () async {
              final result = await context
                  .read(dashboardProvider)
                  .changePassword(formKey.currentState.value.cast());

              if (result) {
                EasyLoading.showSuccess(Strings.success);

                context.navigator.pop();
              } else {
                EasyLoading.showError(Strings.failure);
              }
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.margin20),
        child: Column(
          children: [
            const SizedBox(height: Sizes.height20),
            FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  CustomTextField(
                    name: 'currentPassword',
                    labelText: Strings.currentPassword,
                    obscureText: true,
                    validator: FormBuilderValidators.required(context),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    name: 'newPassword',
                    labelText: Strings.newPassword,
                    obscureText: true,
                    validator: FormBuilderValidators.required(context),
                  ),
                  const SizedBox(height: 12),
                  CustomTextField(
                    name: 'confirmPassword',
                    labelText: Strings.confirmNewPassword,
                    obscureText: true,
                    validator: FormBuilderValidators.required(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
