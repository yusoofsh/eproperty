import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:build_context/build_context.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/filter_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final viewModelProvider = ChangeNotifierProvider<FilterViewModel>(
  (_) => FilterViewModel(),
);

class FilterView extends StatefulWidget {
  @override
  _FilterViewState createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<ActionEntry> actions() {
    return [
      ActionEntry(
        event: const Loading(),
        action: (_) {
          EasyLoading.show(status: Strings.PLEASE_WAIT);
        },
      ),
      ActionEntry(
        event: const Success(),
        action: (_) {
          context.navigator.replace('/dashboard');
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    context.read(viewModelProvider).initActions(actions());
    context.read(viewModelProvider).populateCompaniesActive();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.mediaQuerySize.height;
    final width = context.mediaQuerySize.width;

    return Scaffold(
      body: GestureDetector(
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
                        Strings.FILL_REQUIRED,
                        style: context.textTheme.headline6.copyWith(
                          fontSize: Sizes.TEXT_SIZE_20,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        Strings.FILTER,
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
              final _wp = watch(viewModelProvider);
              final _items = _wp.companiesActive;
              return CustomDropdownField(
                labelText: Strings.COMPANY,
                name: 'company',
                items: _items.map<DropdownMenuItem<String>>(
                  (value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      onTap: () {
                        _wp.populateCompaniesChild(value.id);
                      },
                      child: Text(value.name),
                    );
                  },
                ).toList(),
                validator: FormBuilderValidators.required(context),
              );
            },
          ),
          Consumer(
            builder: (context, watch, _) {
              final _wp = watch(viewModelProvider);
              final _items = _wp.companiesChild;
              if (_items.isEmpty) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const CustomSpaces(height: 12),
                    CustomDropdownField(
                      labelText: Strings.PROJECT,
                      name: 'project',
                      items: _items.map<DropdownMenuItem<String>>(
                        (value) {
                          return DropdownMenuItem<String>(
                            onTap: () => _wp.configureDateInput(),
                            value: value.name,
                            child: Text(value.name),
                          );
                        },
                      ).toList(),
                      validator: FormBuilderValidators.required(context),
                    ),
                  ],
                );
              }
            },
          ),
          Consumer(
            builder: (context, watch, _) {
              final _wp = watch(viewModelProvider);
              final _enableDateInput = _wp.enableDateInput;
              final _months = _wp.months;
              final _years = _wp.years;
              if (!_enableDateInput) {
                return const SizedBox();
              } else {
                return Column(
                  children: [
                    const CustomSpaces(height: 12),
                    CustomDropdownField(
                      labelText: Strings.YEAR,
                      name: 'year',
                      items: _years.map<DropdownMenuItem<int>>(
                        (value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        },
                      ).toList(),
                      validator: FormBuilderValidators.required(context),
                    ),
                    const CustomSpaces(height: 12),
                    CustomDropdownField(
                      labelText: Strings.MONTH,
                      name: 'month',
                      items: _months
                          .map((id, name) {
                            return MapEntry(
                              id,
                              DropdownMenuItem<int>(
                                value: id,
                                child: Text(name),
                              ),
                            );
                          })
                          .values
                          .toList(),
                      validator: FormBuilderValidators.required(context),
                    ),
                  ],
                );
              }
            },
          ),
          const CustomSpaces(height: 12),
          Row(
            children: [
              const Spacer(),
              CustomButton(
                title: Strings.DONE,
                theme: context.theme,
                onPressed: () {
                  if (!context.focusScope.hasPrimaryFocus) {
                    context.focusScope.unfocus();
                  }
                  final formState = formKey.currentState;
                  if (formState.saveAndValidate()) {
                    context.read(viewModelProvider).storeCompaniesPreference(
                          formState.value.cast(),
                        );
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
