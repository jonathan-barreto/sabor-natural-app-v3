import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/filter_button_widget.dart';
import 'package:sabor_natural_app/src/presenter/search/widgets/text_field_search_bar_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onPressed;
  final VoidCallback clearPressed;
  final void Function(String) onChange;

  const SearchBarWidget({
    super.key,
    required this.textController,
    required this.onPressed,
    required this.clearPressed,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: StyleValues.small,
      ),
      child: Row(
        children: [
          TextFieldSearchBarWidget(
            controller: textController,
            clearPressed: () => clearPressed(),
            onChange: (value) => onChange(value),
          ),
          const SizedBox(
            width: StyleValues.small,
          ),
          FilterButtonWidget(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}