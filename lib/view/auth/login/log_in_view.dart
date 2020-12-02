import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_button.dart';
import 'package:eproperty/view/core/widget/custom_clip_shadow.dart';
import 'package:eproperty/view/core/widget/custom_clipper_shape.dart';
import 'package:eproperty/view/core/widget/custom_field.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view_model/log_in_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderListener<LogInViewModel>(
      provider: logInViewModelProvider,
      onChange: (context, value) {
        final _state = value.state;

        switch (_state) {
          case LogInState.loading:
            EasyLoading.show(status: Strings.pleaseWait);

            break;
          case LogInState.failure:
            final _message = value.message;

            EasyLoading.showError(_message);

            break;
          case LogInState.success:
            EasyLoading.showSuccess(
              Strings.success,
            );

            context.navigator.pushAndRemoveUntil(
              Routes.filterView,
              (_) => false,
            );

            break;
        }
      },
      child: const Scaffold(
        body: BuildBody(),
      ),
    );
  }
}

class BuildBody extends StatelessWidget {
  const BuildBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = context.mediaQuerySize.height;
    final width = context.mediaQuerySize.width;

    return GestureDetector(
      onTap: () {
        if (!context.focusScope.hasPrimaryFocus) {
          context.focusScope.unfocus();
        }
      },
      child: Stack(
        children: [
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
                margin: const EdgeInsets.only(left: Sizes.margin24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    Text(
                      Strings.welcome,
                      style: context.textTheme.headline6.copyWith(
                        fontSize: Sizes.textSize20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.logIn,
                      style: context.textTheme.headline4.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(Sizes.padding0),
            children: [
              SizedBox(
                height: height * 0.45,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.margin20,
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
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            name: 'email',
            labelText: Strings.email,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
          ),
          const CustomSpaces(height: 12),
          CustomTextField(
            name: 'password',
            labelText: Strings.password,
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
                onTap: () => context.navigator.push(Routes.forgotView),
                child: Text(
                  Strings.forgot,
                  style: context.textTheme.subtitle2.copyWith(
                    color: Colors.black87,
                    fontSize: Sizes.textSize14,
                  ),
                ),
              ),
              const Spacer(),
              CustomElevatedButton(
                title: Strings.logIn,
                onPressed: () {
                  if (!context.focusScope.hasPrimaryFocus) {
                    context.focusScope.unfocus();
                  }
                  final formState = formKey.currentState;
                  final crp = context.read(logInViewModelProvider);
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
