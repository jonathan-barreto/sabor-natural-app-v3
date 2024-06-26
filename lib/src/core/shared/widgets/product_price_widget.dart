import 'package:auto_size_text/auto_size_text.dart';
import 'package:feirapp/src/core/shared/constants/app_style_values.dart';
import 'package:flutter/material.dart';

class ProductPriceWidget extends StatelessWidget {
  final String price;
  final String? discountPrice;
  final String? weight;

  const ProductPriceWidget({
    super.key,
    required this.price,
    this.discountPrice,
    this.weight,
  });

  String getPriceFormated({required String value}) {
    final String priceFormated = value.replaceAll('.', ',');

    if (priceFormated.contains(',') == false) return 'R\$ $priceFormated,00';

    if (priceFormated.isNotEmpty) {
      final List<String> strings = priceFormated.split(',');

      if (strings.isNotEmpty) {
        if (strings[1].length == 1) {
          return 'R\$ ${priceFormated}0';
        }
      }
    }

    return 'R\$ $priceFormated';
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Visibility(
          visible: discountPrice == null,
          child: Row(
            children: [
              AutoSizeText(
                getPriceFormated(value: price),
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: discountPrice != null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AutoSizeText(
                getPriceFormated(value: discountPrice ?? ''),
                style: textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: AppStyleValues.small,
              ),
              AutoSizeText(
                getPriceFormated(value: price),
                style: textTheme.bodySmall?.copyWith(
                  fontSize: AppStyleValues.small,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
