import 'package:build_context/build_context.dart';
import 'package:eproperty/value/colors.dart';
import 'package:eproperty/value/sizes.dart';
import 'package:flutter/material.dart' hide Colors;

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    @required this.onPressed,
    @required this.title,
    this.color,
    this.icon,
    Key key,
  }) : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: BuildContent(
        color: color,
        icon: icon,
        title: title,
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    @required this.onPressed,
    @required this.title,
    this.color,
    this.icon,
    Key key,
  }) : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: BuildContent(
        color: color,
        icon: icon,
        title: title,
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    @required this.onPressed,
    @required this.icon,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: Sizes.size24,
      ),
    );
  }
}

class BuildContent extends StatelessWidget {
  const BuildContent({
    @required this.icon,
    @required this.title,
    this.color,
    Key key,
  }) : super(key: key);

  final Widget icon;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon ?? const SizedBox(),
        if (icon != null) const SizedBox(width: 8) else const SizedBox(),
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.padding16,
              vertical: Sizes.padding8,
            ),
            child: Text(
              title.toUpperCase(),
              style: context.theme.textTheme.button.copyWith(
                color: color ?? Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        else
          const SizedBox(),
      ],
    );
  }
}
