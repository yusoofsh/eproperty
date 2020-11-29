import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/log_in_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          LoadingHelper().show(Strings.PLEASE_WAIT);
        },
      ),
      ActionEntry(
        event: const Success(),
        action: (_) {
          LoadingHelper().show(
            Strings.SUCCESS,
            type: 'success',
          );

          context.navigator.replace('/filter-view');
        },
      ),
      ActionEntry(
        event: const Failure(),
        action: (_) {
          LoadingHelper().show(
            Strings.FAILURE,
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
    final theme = Theme.of(context);
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
              color: Colors.blue,
            ),
            child: Container(
              height: height * 0.4,
              width: width,
              color: Colors.blue,
              child: Container(
                margin: const EdgeInsets.only(left: Sizes.MARGIN_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      Strings.WELCOME_BACK,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.LOG_IN,
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
            padding: const EdgeInsets.all(Sizes.PADDING_0),
            children: <Widget>[
              SizedBox(
                height: height * 0.45,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.MARGIN_20,
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
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            name: 'email',
            labelText: Strings.EMAIL_ADDRESS,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
          ),
          const CustomSpaces(height: 12),
          CustomTextField(
            name: 'password',
            labelText: Strings.PASSWORD,
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.maxLength(context, 24),
            ]),
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
                  context.navigator.push('/forgot-initial-view');
                },
                child: Text(
                  Strings.FORGOT_PASSWORD,
                  style: theme.textTheme.subtitle2.copyWith(
                    color: Colors.black87,
                    fontSize: Sizes.TEXT_SIZE_14,
                  ),
                ),
              ),
              const Spacer(),
              CustomButton(
                title: Strings.LOG_IN,
                theme: theme,
                onPressed: () {
                  FocusHelper(context).unfocus();
                  final formState = formKey.currentState;
                  final crp = context.read(viewModelProvider);
                  if (formState.saveAndValidate()) {
                    crp.requestAuthentication(formState.value);
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
