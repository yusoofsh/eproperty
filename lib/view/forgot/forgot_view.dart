import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:eproperty/value/strings.dart';
import 'package:eproperty/view/core/widget/custom_button.dart';
import 'package:eproperty/view/core/widget/custom_clip_shadow.dart';
import 'package:eproperty/view/core/widget/custom_clip_shape.dart';
import 'package:eproperty/view/core/widget/custom_field.dart';
import 'package:eproperty/view/core/widget/custom_spaces.dart';
import 'package:eproperty/view_model/forgot_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderListener<ForgotViewModel>(
      provider: forgotViewModelProvider,
      onChange: (context, value) {
        final _state = value.state;

        switch (_state) {
          case ForgotState.loading:
            EasyLoading.show(status: Strings.pleaseWait);

            break;
          case ForgotState.next:
            EasyLoading.dismiss();

            break;
          case ForgotState.failure:
            final _message = value.message;

            EasyLoading.showError(_message);

            break;
          case ForgotState.success:
            EasyLoading.showSuccess(
              Strings.success,
            );

            context.navigator.pushAndRemoveUntil(
              Routes.logInView,
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
  const BuildBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _height = context.mediaQuerySize.height;
    final _width = context.mediaQuerySize.width;

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
              height: _height * 0.4,
              width: _width,
              color: Colors.blue,
              child: Container(
                margin: const EdgeInsets.only(
                  left: Sizes.margin24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _height * 0.1,
                    ),
                    Text(
                      Strings.noWorries,
                      style: context.textTheme.headline6.copyWith(
                        fontSize: Sizes.textSize20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.resetPassword,
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
                  height: _height * 0.45),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.margin20,
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
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            name: 'email',
            labelText: Strings.email,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context),
              FormBuilderValidators.email(context),
            ]),
            suffix: CustomTextButton(
              title: Strings.requestCode,
              color: Colors.black,
              onPressed: () {
                if (!context.focusScope.hasPrimaryFocus) {
                  context.focusScope.unfocus();
                }
                final _formState = _formKey.currentState;
                if (_formState.saveAndValidate()) {
                  context
                      .read(forgotViewModelProvider)
                      .requestCode(_formState.value.cast());
                }
              },
            ),
          ),
          Consumer(
            builder: (context, watch, _) {
              final wp = watch(forgotViewModelProvider);
              final _state = wp.state;
              if (_state != ForgotState.next) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'code',
                      labelText: Strings.code,
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'newPassword',
                      obscureText: true,
                      labelText: Strings.newPassword,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'confirmNewPassword',
                      obscureText: true,
                      labelText: Strings.confirmNewPassword,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    Row(
                      children: [
                        const SizedBox(),
                        const Spacer(),
                        CustomElevatedButton(
                          title: Strings.reset,
                          onPressed: () {
                            if (!context.focusScope.hasPrimaryFocus) {
                              context.focusScope.unfocus();
                            }
                            final _formState = _formKey.currentState;
                            if (_formState.saveAndValidate()) {
                              context
                                  .read(forgotViewModelProvider)
                                  .requestReset(_formState.value);
                            }
                          },
                        ),
                      ],
                    )
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
