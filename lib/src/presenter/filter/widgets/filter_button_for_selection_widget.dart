import 'package:feirapp/src/core/shared/constants/app_colors.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class FilterButtonForSelectionWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButtonForSelectionWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const ligthGrey = MaterialStatePropertyAll(AppColors.lightGrey);
    const green = MaterialStatePropertyAll(AppColors.primary);

    final ThemeData theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: isSelected ? green : ligthGrey,
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppStyleValues.small,
            ),
          ),
        ),
        // shape: MaterialStateProperty(

        // ),
      ),
      child: Text(
        label,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isSelected ? AppColors.white : AppColors.darkGrey,
        ),
      ),
    );
  }
}
