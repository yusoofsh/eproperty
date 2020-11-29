import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/forgot_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = StateNotifierProvider<ForgotViewModel>(
  (_) => ForgotViewModel(),
);

class ForgotView extends ConsumerWidget {
  @override
  Widget build(
    BuildContext context,
    ScopedReader watch,
  ) {
    final _state = watch(viewModelProvider.state);

    if (_state == ForgotState.loading) {
      EasyLoading.show(status: Strings.PLEASE_WAIT);
    } else if (_state == ForgotState.failure) {
      final _message = watch(viewModelProvider).message;

      EasyLoading.showError(_message);
    } else if (_state == ForgotState.success) {
      EasyLoading.showSuccess(
        Strings.SUCCESS,
      );

      context.navigator.pushAndRemoveUntil(
        Routes.logInView,
        (_) => false,
      );
    } else if (_state == ForgotState.dismiss) {
      EasyLoading.dismiss();
    }

    return const Scaffold(
      body: BuildBody(),
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
        children: <Widget>[
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
                  left: Sizes.MARGIN_24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: _height * 0.1,
                    ),
                    Text(
                      Strings.DONT_WORRY,
                      style: context.textTheme.headline6.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.RESET_PASSWORD,
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
            padding: const EdgeInsets.all(Sizes.PADDING_0),
            children: <Widget>[
              SizedBox(
                height: _height * 0.45,
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
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: CustomTextField(
                  name: 'email',
                  labelText: Strings.EMAIL_ADDRESS,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ]),
                ),
              ),
              const CustomSpaces(width: Sizes.WIDTH_8),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    if (!context.focusScope.hasPrimaryFocus) {
                      context.focusScope.unfocus();
                    }

                    final _formState = _formKey.currentState;

                    if (_formState.saveAndValidate()) {
                      context
                          .read(viewModelProvider)
                          .requestCode(_formState.value.cast());
                    }
                  },
                  child: const Text(Strings.REQUEST_CODE),
                ),
              )
            ],
          ),
          Consumer(
            builder: (context, watch, _) {
              final wp = watch(viewModelProvider);
              final enableNextInput = wp.enableNextInput;

              if (!enableNextInput) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'code',
                      labelText: Strings.CODE,
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'newPassword',
                      obscureText: true,
                      labelText: Strings.NEW_PASSWORD,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    CustomTextField(
                      name: 'confirmNewPassword',
                      obscureText: true,
                      labelText: Strings.CONFIRM_NEW_PASSWORD,
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    Row(
                      children: [
                        const SizedBox(),
                        const Spacer(),
                        CustomButton(
                          title: Strings.RESET,
                          theme: context.theme,
                          onPressed: () {
                            if (!context.focusScope.hasPrimaryFocus) {
                              context.focusScope.unfocus();
                            }

                            final _formState = _formKey.currentState;

                            if (_formState.saveAndValidate()) {
                              context.read(viewModelProvider).requestReset(
                                    _formState.value,
                                  );
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
