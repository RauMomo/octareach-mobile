import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:flutter/material.dart';

class ReadOnlyTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String value;
  final InputDecoration? decoration;
  final IconData? icon;
  final VoidCallback? onTap;

  factory ReadOnlyTextFieldWidget(String value,
      [IconData? icon,
      InputDecoration? decoration,
      VoidCallback? onTap,
      Key? key]) {
    return ReadOnlyTextFieldWidget._(
      value: value,
      decoration: decoration,
      controller: TextEditingController(text: value),
      icon: icon,
      onTap: onTap,
      key: Key.new(value),
    );
  }

  const ReadOnlyTextFieldWidget._(
      {required this.value,
      required this.decoration,
      required this.controller,
      required this.icon,
      required this.onTap,
      required Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.labelMedium!,
      controller: controller,
      readOnly: true,
      enabled: false,
      autofocus: false,
      decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(width: 2.0, color: context.primary),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          hintText: 'Phone here',
          prefixIcon: icon != null
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: Icon(icon, color: context.primary),
                )
              : SizedBox.shrink(),
          suffixIconConstraints: BoxConstraints(
            minWidth: 10,
          ),
          hintStyle: context.textTheme.labelMedium),
    );
  }
}
