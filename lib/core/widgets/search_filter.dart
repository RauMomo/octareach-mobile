import 'package:boilerplate/constants/colors.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/utils/conversion/extensions.dart';
import 'package:boilerplate/utils/functions/debouncer.dart';
import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  final TextEditingController _searchController = new TextEditingController();

  final void Function(dynamic) onSearchMode;

  SearchFilter({super.key, required this.onSearchMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (String value) {
              if (value.length >= 2)
                debouncer(() {
                  onSearchMode.call(value);
                });
            },
            autofocus: false,
            textInputAction: TextInputAction.go,
            maxLength: 45,
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: InputDecoration(
              constraints: BoxConstraints(
                  maxHeight: context.mediaQuery.size.height * .1),
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.0, color: AppColors.borderColor),
                borderRadius: BorderRadius.circular(18),
              ),
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.labelLarge,
              counterText: '',
              suffixIcon: IconButton(
                icon: Icon(Icons.search, color: AppColors.subtitleColor),
                onPressed: () {
                  if (_searchController.text.length >= 2)
                    debouncer(() {
                      onSearchMode.call(_searchController.text);
                    });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RoundedButtonWidget(
                padding: 8,
                height: 30,
                buttonTextSize: 14,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                textColor: Colors.white,
                onPressed: () {
                  debugPrint('asem');
                },
                isFullWidth: false,
                buttonColor: context.primary,
                buttonText: 'Filter',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
