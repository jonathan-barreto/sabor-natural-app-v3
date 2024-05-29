import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sabor_natural_app/src/core/shared/constants/endpoints.dart';
import 'package:sabor_natural_app/src/core/shared/constants/style_values.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/add_to_cart_button_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/circular_progress_indicator_custom.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/product_price_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/product_title_widget.dart';
import 'package:sabor_natural_app/src/core/shared/widgets/product_unit_and_weight_widget.dart';
import 'package:sabor_natural_app/src/domain/entities/product_entity.dart';
import 'package:sabor_natural_app/src/presenter/product/page/product_page.dart';

class CardProductWidget extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback addProductFunction;

  const CardProductWidget({
    super.key,
    required this.product,
    required this.addProductFunction,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              id: '${product.id}',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            StyleValues.small,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: StyleValues.extraLarge * 3,
                imageUrl: '${EndPoints.baseUrlImage}${product.image}',
                errorWidget: (context, url, error) => const Icon(Icons.error),
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return const CircularProgressIndicatorCustom();
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: StyleValues.small,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // DiscountContainerWidget(
                    //   discount: product.discount ?? 0,
                    // ),
                    ProductPriceWidget(
                      price: product.price,
                      discountPrice: product.discountPrice,
                      weight: product.weight,
                    ),
                    ProductTitleWidget(
                      productName: product.name,
                    ),
                    ProductUnitAndWeightWidget(
                      productUnit: product.unit,
                      productWeight: product.weight,
                    ),
                    AddToCartButtonWidget(
                      onPressed: addProductFunction,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
