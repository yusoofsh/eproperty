import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helpers/helpers.dart';
import 'package:eproperty/providers/login_provider.dart';
import 'package:eproperty/values/values.dart';
import 'package:eproperty/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BuildBody(),
    );
  }
}

class BuildBody extends StatefulHookWidget {
  const BuildBody({Key key}) : super(key: key);

  @override
  _BuildBodyState createState() => _BuildBodyState();
}

class _BuildBodyState extends State<BuildBody> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  List<ActionEntry> actions() {
    return [
      ActionEntry(
        event: LoadingEvent(),
        action: (_) {
          LoadingHelper().show();
        },
      ),
      ActionEntry(
        event: SuccessEvent(),
        action: (_) {
          LoadingHelper().show('success');
        },
      ),
      ActionEntry(
        event: FailureEvent(),
        action: (_) {
          LoadingHelper().show('failure');
        },
      )
    ];
  }

  @override
  void initState() {
    super.initState();

    context.read(loginProvider).initActions(actions());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                  child: BuildForm(formKey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;

  const BuildForm(this.formKey);

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
              Text(
                CustomStrings.FORGOT_PASSWORD,
                style: theme.textTheme.subtitle2.copyWith(
                  color: Colors.black87,
                  fontSize: CustomSizes.TEXT_SIZE_14,
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
                    final formState = formKey.currentState;
                    if (formState.saveAndValidate()) {
                      context
                          .read(loginProvider)
                          .parseCredential(formState.value);
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
