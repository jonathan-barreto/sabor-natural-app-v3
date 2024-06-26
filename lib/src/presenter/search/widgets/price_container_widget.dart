import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';

class PriceContainerWidget extends StatelessWidget {
  final String value;

  const PriceContainerWidget({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppStyleValues.smaller,
      ),
      child: Container(
        height: AppStyleValues.extraLarge,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(
            AppStyleValues.small,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppStyleValues.smaller,
              ),
              child: Text(
                'R\$',
                style: textTheme.bodyMedium?.copyWith(),
              ),
            ),
            Expanded(
              child: AutoSizeText(
                value,
                maxLines: 1,
                style: textTheme.bodyMedium?.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
