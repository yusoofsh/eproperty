import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/forgot_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = Provider<ForgotViewModel>(
  (_) => ForgotViewModel(),
);

class ForgotFinalView extends StatefulWidget {
  @override
  _ForgotFinalViewState createState() => _ForgotFinalViewState();
}

class _ForgotFinalViewState extends State<ForgotFinalView> {
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

          context.navigator.replace('/log-in-view');
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
                      Strings.DONT_WORRY,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.RESET_PASSWORD,
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
                child: const BuildForm(),
              ),
            ],
          ),
        ],
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
  final forgotFinalFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: forgotFinalFormKey,
      child: Column(
        children: [
          CustomTextField(
            name: 'code',
            hintText: Strings.CODE,
            labelText: Strings.CODE,
            keyboardType: TextInputType.number,
            validators: FormBuilderValidators.required(context),
          ),
          const CustomSpaces(height: 8),
          CustomTextField(
            name: 'newPassword',
            obscureText: true,
            hintText: Strings.NEW_PASSWORD,
            labelText: Strings.NEW_PASSWORD,
            validators: FormBuilderValidators.required(context),
          ),
          const CustomSpaces(height: 8),
          CustomTextField(
            name: 'confirmNewPassword',
            obscureText: true,
            hintText: Strings.CONFIRM_NEW_PASSWORD,
            labelText: Strings.CONFIRM_NEW_PASSWORD,
            validators: FormBuilderValidators.required(context),
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              const SizedBox(),
              const Spacer(),
              CustomButton(
                title: Strings.RESET,
                theme: theme,
                onPressed: () {
                  final formState = forgotFinalFormKey.currentState;

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
