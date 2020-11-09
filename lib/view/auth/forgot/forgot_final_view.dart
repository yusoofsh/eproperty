import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/auth/widget/button_widget.dart';
import 'package:eproperty/view/auth/widget/text_field_widget.dart';
import 'package:eproperty/view_model/forgot_view_model.dart';
import 'package:eproperty/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewModelProvider = Provider<ForgotViewModel>(
  (_) => ForgotViewModel(),
);

class ForgotFinalView extends StatefulWidget {
  @override
  _ForgotFinalViewState createState() => _ForgotFinalViewState();
}

class _ForgotFinalViewState extends State<ForgotFinalView> {
  final GlobalKey<FormBuilderState> formKeyTwo = GlobalKey<FormBuilderState>();

  List<ActionEntry> actions() {
    return [
      ActionEntry(
          event: const Loading(),
          action: (_) {
            LoadingHelper().show(CustomStrings.PLEASE_WAIT);
          }),
      ActionEntry(
        event: const Success(),
        action: (_) {
          LoadingHelper().show(
            CustomStrings.LOG_IN_SUCCESS,
            type: 'success',
          );

          context.navigator.replace('/log-in-view');
        },
      ),
      ActionEntry(
        event: const Failure(),
        action: (_) {
          LoadingHelper().show(
            CustomStrings.LOG_IN_FAILURE,
            type: 'failure',
          );
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    context.read(viewModelProvider).initActions(actions());
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final ThemeData theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return FlutterEasyLoading(
      child: GestureDetector(
        onTap: () {
          FocusHelper(context).unfocus();
        },
        child: Stack(
          children: <Widget>[
            CustomClipShadow(
              clipper: CustomClipperShape(),
              shadow: const Shadow(
                blurRadius: 24,
                color: CustomColors.blue,
              ),
              child: Container(
                height: height * 0.4,
                width: width,
                color: CustomColors.blue,
                child: Container(
                  margin: const EdgeInsets.only(left: CustomSizes.MARGIN_24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Text(
                        CustomStrings.DONT_WORRY,
                        style: theme.textTheme.headline6.copyWith(
                          fontSize: CustomSizes.TEXT_SIZE_20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        CustomStrings.RESET_PASSWORD,
                        style: theme.textTheme.headline4.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(CustomSizes.PADDING_0),
              children: <Widget>[
                SizedBox(
                  height: height * 0.45,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: CustomSizes.MARGIN_20,
                  ),
                  child: const BuildForm(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({Key key}) : super(key: key);

  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          BuildTextField(
            attribute: 'code',
            labelText: CustomStrings.CODE,
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          const CustomSpaces(height: 8),
          BuildTextField(
            attribute: 'newPassword',
            obscureText: true,
            labelText: CustomStrings.NEW_PASSWORD,
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          const CustomSpaces(height: 8),
          BuildTextField(
            attribute: 'confirmNewPassword',
            obscureText: true,
            labelText: CustomStrings.CONFIRM_NEW_PASSWORD,
            validators: [
              FormBuilderValidators.required(),
            ],
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              const SizedBox(),
              const Spacer(),
              BuildButton(
                title: CustomStrings.RESET_PASSWORD,
                theme: theme,
                onPressed: () {
                  final formState = formKey.currentState;

                  FocusHelper(context).unfocus();

                  if (formState.saveAndValidate()) {
                    context
                        .read(viewModelProvider)
                        .requestReset(formState.value);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
