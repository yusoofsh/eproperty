import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/event_helper.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view_model/log_in_view_model.dart';
import 'package:eproperty/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final logInProvider = Provider<LogInViewModel>(
  (_) => LogInViewModel(),
);

class LogInView extends StatefulWidget {
  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
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

          context.navigator.replace('/dashboard-view');
        },
      ),
      ActionEntry(
        event: Failure(),
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

    context.read(logInProvider).initActions(actions());
  }

  @override
  Widget build(BuildContext context,) {
    final ThemeData theme = Theme.of(context);
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return FlutterEasyLoading(
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
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
                        CustomStrings.WELCOME_BACK,
                        style: theme.textTheme.headline6.copyWith(
                          fontSize: CustomSizes.TEXT_SIZE_20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        CustomStrings.LOG_IN,
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
                  child: BuildForm(),
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
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return FormBuilder(
      key: formKey,
      child: Column(
        children: <Widget>[
          FormBuilderTextField(
            attribute: 'email',
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: CustomStrings.EMAIL_ADDRESS,
              labelStyle: CustomStyles.customTextStyle(),
              hintStyle: CustomStyles.customTextStyle(),
              border: CustomBorders.customOutlineInputBorder(),
              enabledBorder: CustomBorders.customOutlineInputBorder(),
            ),
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
          const CustomSpaces(height: 8),
          FormBuilderTextField(
            attribute: 'password',
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: CustomStyles.customTextStyle(),
            decoration: InputDecoration(
              labelText: CustomStrings.PASSWORD,
              labelStyle: CustomStyles.customTextStyle(),
              hintStyle: CustomStyles.customTextStyle(),
              border: CustomBorders.customOutlineInputBorder(),
              enabledBorder: CustomBorders.customOutlineInputBorder(),
              suffixIcon: const Icon(
                FeatherIcons.lock,
                color: Colors.black87,
              ),
            ),
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(24),
            ],
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () => context.read(logInProvider).forgotCredential(),
                child: Text(
                  CustomStrings.FORGOT_PASSWORD,
                  style: theme.textTheme.subtitle2.copyWith(
                    color: Colors.black87,
                    fontSize: CustomSizes.TEXT_SIZE_14,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: CustomSizes.WIDTH_180,
                decoration: Decorations.customBoxDecoration(blurRadius: 10),
                child: CustomButton(
                  title: CustomStrings.LOG_IN,
                  elevation: CustomSizes.ELEVATION_8,
                  textStyle: theme.textTheme.subtitle2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  color: CustomColors.blue,
                  height: CustomSizes.HEIGHT_40,
                  onPressed: () {
                    FocusScope.of(context).unfocus();

                    final formState = formKey.currentState;
                    if (formState.saveAndValidate()) {
                      context
                          .read(logInProvider)
                          .requestAuthentication(formState.value);
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
