import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/auth/widget/button_widget.dart';
import 'package:eproperty/view/auth/widget/text_field_widget.dart';
import 'package:eproperty/view_model/log_in_view_model.dart';
import 'package:eproperty/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewModelProvider = Provider<LogInViewModel>(
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
        },
      ),
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
        event: const Failure(),
        action: (_) {
          LoadingHelper().show(
            CustomStrings.LOG_IN_FAILURE,
            type: 'failure',
          );
        },
      ),
      ActionEntry(
        event: const Forgot(),
        action: (_) {
          context.navigator.push('/forgot-initial-view');
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

    return GestureDetector(
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
    );
  }
}

class BuildForm extends StatefulWidget {
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  final logInFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: logInFormKey,
      child: Column(
        children: [
          BuildTextField(
            attribute: 'email',
            labelText: CustomStrings.EMAIL_ADDRESS,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
          const CustomSpaces(height: 8),
          BuildTextField(
            attribute: 'password',
            labelText: CustomStrings.PASSWORD,
            obscureText: true,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(24),
            ],
            suffixIcon: const Icon(
              FeatherIcons.lock,
              color: Colors.black87,
            ),
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              InkWell(
                onTap: () {
                  context.read(viewModelProvider).goToForgot();
                },
                child: Text(
                  CustomStrings.FORGOT_PASSWORD,
                  style: theme.textTheme.subtitle2.copyWith(
                    color: Colors.black87,
                    fontSize: CustomSizes.TEXT_SIZE_14,
                  ),
                ),
              ),
              const Spacer(),
              BuildButton(
                title: CustomStrings.LOG_IN,
                theme: theme,
                onPressed: () {
                  FocusHelper(context).unfocus();

                  final formState = logInFormKey.currentState;

                  if (formState.saveAndValidate()) {
                    context
                        .read(viewModelProvider)
                        .requestAuthentication(formState.value);
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
