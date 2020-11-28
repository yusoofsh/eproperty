import 'package:action_mixin/action_mixin.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/filter_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
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
          LoadingHelper().show(Strings.PLEASE_WAIT);
        },
      ),
      ActionEntry(
        event: const Success(),
        action: (_) {
          context.navigator.replace('/dashboard-view');
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
                      Strings.FILL_REQUIRED,
                      style: theme.textTheme.headline6.copyWith(
                        fontSize: Sizes.TEXT_SIZE_20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      Strings.FILTER,
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
          Consumer(
            builder: (context, watch, _) {
              // Listens to the value exposed by counterProvider
              final wp = watch(viewModelProvider);
              final items = wp.companiesActive;
              return CustomDropdownField(
                name: 'company',
                labelText: Strings.COMPANY,
                items: items.map<DropdownMenuItem<Datum>>(
                      (value) {
                    return DropdownMenuItem<Datum>(
                      value: value ?? '',
                      onTap: () => wp.populateCompaniesChild(value.id),
                      child: Text(value.name ?? ''),
                    );
                  },
                ).toList(),
                validators: [
                  FormBuilderValidators.required(context),
                ],
              );
            },
          ),
          const CustomSpaces(height: 8),
          Consumer(
            builder: (context, watch, _) {
              // Listens to the value exposed by counterProvider
              final wp = watch(viewModelProvider);
              final items = wp.companiesChild;
              if (items.isEmpty) {
                return const SizedBox();
              } else {
                return CustomDropdownField(
                  name: 'project',
                  labelText: Strings.PROJECT,
                  items: items.map<DropdownMenuItem<Datum>>(
                        (value) {
                      return DropdownMenuItem<Datum>(
                        value: value,
                        child: Text(value.name),
                      );
                    },
                  ).toList(),
                  validators: [
                    FormBuilderValidators.required(context),
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
                theme: theme,
                onPressed: () {
                  FocusHelper(context).unfocus();
                  final formState = formKey.currentState;
                  if (formState.saveAndValidate()) {
                    context.read(viewModelProvider).storeSelectedCompanies(
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
