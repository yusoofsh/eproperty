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
import 'package:eproperty/view_model/filter_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read(filterViewModelProvider).populateCompaniesActive();

    return ProviderListener<FilterViewModel>(
      provider: filterViewModelProvider,
      onChange: (context, value) {
        final _state = value.state;

        switch (_state) {
          case FilterState.loading:
            EasyLoading.show(status: Strings.pleaseWait);

            break;
          case FilterState.dismiss:
            EasyLoading.dismiss();

            break;
          case FilterState.next:
            EasyLoading.dismiss();

            break;
          case FilterState.failure:
            final _message = value.message;

            EasyLoading.showError(_message);

            break;
          case FilterState.success:
            context.navigator.replace(Routes.dashboardView);

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
                margin: const EdgeInsets.only(left: Sizes.margin24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: _height * 0.1,
                    ),
                    Text(
                      Strings.fillRequired,
                      style: context.textTheme.headline6.copyWith(
                        fontSize: Sizes.textSize20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.filter,
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
              SizedBox(height: _height * 0.45),
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
          Consumer(
            builder: (context, watch, _) {
              final _wp = watch(filterViewModelProvider);

              final _companiesActive = _wp.companiesActive;
              return CustomDropdownField(
                name: 'company',
                labelText: Strings.company,
                onChanged: (_) => _wp.resetFormValue(formKey, 'project'),
                validator: FormBuilderValidators.required(context),
                items: _companiesActive.map<DropdownMenuItem<String>>(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      onTap: () => _wp.populateCompaniesChild(value.id),
                      child: Text(value.name),
                    );
                  },
                ).toList(),
              );
            },
          ),
          Consumer(
            builder: (context, watch, _) {
              final _wp = watch(filterViewModelProvider);
              final _companiesChild = _wp.companiesChild;

              if (_companiesChild.isEmpty) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    CustomDropdownField(
                      name: 'project',
                      labelText: Strings.project,
                      validator: FormBuilderValidators.required(context),
                      items: _companiesChild.map<DropdownMenuItem<String>>(
                        (value) {
                          return DropdownMenuItem<String>(
                            value: value.name,
                            onTap: () => _wp.configureDateInput(),
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                    ),
                  ],
                );
              }
            },
          ),
          Consumer(
            builder: (context, watch, _) {
              final _wp = watch(filterViewModelProvider);
              final _state = _wp.state;
              final _months = _wp.months;
              final _years = _wp.years;

              if (_state != FilterState.next) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const SizedBox(height: 12),
                    CustomDropdownField(
                      labelText: Strings.year,
                      name: 'year',
                      validator: FormBuilderValidators.required(context),
                      items: _years.map<DropdownMenuItem<int>>(
                        (value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 12),
                    CustomDropdownField(
                      name: 'month',
                      labelText: Strings.month,
                      validator: FormBuilderValidators.required(context),
                      items: _months
                          .map(
                            (id, name) {
                              return MapEntry(
                                id,
                                DropdownMenuItem<int>(
                                  value: id,
                                  child: Text(name),
                                ),
                              );
                            },
                          )
                          .values
                          .toList(),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Spacer(),
              CustomElevatedButton(
                title: Strings.done,
                onPressed: () {
                  if (!context.focusScope.hasPrimaryFocus) {
                    context.focusScope.unfocus();
                  }
                  final formState = formKey.currentState;
                  if (formState.saveAndValidate()) {
                    context
                        .read(filterViewModelProvider)
                        .storePreferences(formState.value.cast());
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
