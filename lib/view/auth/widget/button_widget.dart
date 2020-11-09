import 'package:auto_route/auto_route.dart';
import 'package:eproperty/value/value.dart';
import 'package:eproperty/widget/widget.dart';
import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  const BuildButton({
    @required this.title,
    @required this.theme,
    @required this.onPressed,
    Key key,
  }) : super(key: key);

  final String title;
  final ThemeData theme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CustomSizes.WIDTH_180,
      decoration: Decorations.customBoxDecoration(blurRadius: 10),
      child: CustomButton(
        title: title,
        elevation: CustomSizes.ELEVATION_8,
        textStyle: theme.textTheme.subtitle2.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        color: CustomColors.blue,
        height: CustomSizes.HEIGHT_40,
        onPressed: onPressed,
      ),
    );
  }
}
