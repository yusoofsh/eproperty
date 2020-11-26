import 'package:action_mixin/action_mixin.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/model/companies_model.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/view/core/widget/widget.dart';
import 'package:eproperty/view_model/filter_view_model.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filterViewModelProvider = ChangeNotifierProvider<FilterViewModel>(
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
        event: const Dismiss(),
        action: (_) {
          LoadingHelper().dismiss();
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    context.read(filterViewModelProvider).initActions(actions());
    context.read(filterViewModelProvider).prepareData();
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
  final logInFormKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FormBuilder(
      key: logInFormKey,
      child: Column(
        children: [
          Consumer(
            builder: (context, watch, _) {
              // Listens to the value exposed by counterProvider
              final items = watch(filterViewModelProvider).companies;
              final selected = watch(filterViewModelProvider).selectedCompanies;

              return CustomDropdownField(
                name: 'companies',
                hintText: Strings.COMPANY,
                labelText: Strings.COMPANY,
                items: items.map<DropdownMenuItem<Datum>>(
                      (value) {
                    return DropdownMenuItem<Datum>(
                      value: value,
                      child: Text(value.name),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  selected(value);
                },
                validators: [
                  FormBuilderValidators.required(context),
                ],
              );
            },
            child: CustomDropdownField(
              name: 'companies',
              hintText: Strings.COMPANY,
              labelText: Strings.COMPANY,
              items: const [],
              validators: [
                FormBuilderValidators.required(context),
              ],
            ),
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

                  final formState = logInFormKey.currentState;

                  if (formState.saveAndValidate()) {
                    context
                        .read(filterViewModelProvider)
                        .requestFilter(formState.value);
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
