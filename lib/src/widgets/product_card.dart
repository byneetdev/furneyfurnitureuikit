import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helpers/constants.dart';
import '../helpers/screens.dart';
import '../models/product_model.dart';
import 'custom_network_image.dart';

enum ProductCardType { Horizontal, Vertical, Grid }

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  final ProductCardType cardType;

  const ProductCard({
    Key? key,
    this.product,
    this.cardType = ProductCardType.Horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _typeCard(ProductCardType type) {
      switch (type) {
        case ProductCardType.Horizontal:
          return _HorizontalType(product: product);
        case ProductCardType.Vertical:
          return _VerticalType(product: product);
        case ProductCardType.Grid:
          return _GridType(product: product);
        default:
          return _HorizontalType(product: product);
      }
    }

    return _typeCard(cardType);
  }
}

class _HorizontalType extends StatelessWidget {
  const _HorizontalType({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.product, arguments: product);
        },
        borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
        child: Container(
          width: 170.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
            color: theme.cardColor,
          ),
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                image: product!.images!.first,
                width: Screens.width(context),
                height: 120.0,
              ),
              Spacer(),
              AutoSizeText(
                product!.name!,
                style: theme.textTheme.headline4!.copyWith(height: 1.2),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AutoSizeText('Byneet DEV',
                        maxLines: 1,
                        style: theme.textTheme.subtitle2!
                            .copyWith(fontSize: 10.0)),
                  ),
                  AutoSizeText(
                    NumberFormat.currency(
                      symbol: '\$',
                      decimalDigits: 0,
                    ).format(product!.price),
                    maxLines: 1,
                    style: theme.textTheme.headline3!
                        .copyWith(color: theme.highlightColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _VerticalType extends StatelessWidget {
  const _VerticalType({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.product, arguments: product);
        },
        borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
        child: Container(
          width: Screens.width(context),
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
            color: theme.cardColor,
          ),
          padding: EdgeInsets.all(15.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomNetworkImage(
                    image: product!.images!.first,
                    width: Screens.width(context) / 3.3,
                    height: Screens.width(context) / 3.3,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: Screens.width(context) / 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        product!.name!,
                        style: theme.textTheme.headline4!.copyWith(height: 1.2),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Byneet DEV',
                        maxLines: 1,
                        style:
                            theme.textTheme.subtitle2!.copyWith(fontSize: 10.0),
                      ),
                      Spacer(),
                      AutoSizeText(
                        NumberFormat.currency(
                          symbol: '\$',
                          decimalDigits: 0,
                        ).format(product!.price),
                        maxLines: 1,
                        style: theme.textTheme.headline3!
                            .copyWith(color: theme.highlightColor),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: CircleAvatar(
                  radius: Screens.width(context) / 20.0,
                  backgroundColor: theme.highlightColor,
                  child: IconButton(
                    icon: Icon(FeatherIcons.heart),
                    iconSize: Screens.width(context) / 18.0,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _GridType extends StatelessWidget {
  final ProductModel? product;

  const _GridType({Key? key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.product, arguments: product);
      },
      borderRadius: BorderRadius.circular(Const.GLOBAL_RADIUS),
      child: Container(
        child: Column(
          children: [
            CustomNetworkImage(
              image: product!.images!.first,
              fit: BoxFit.fitWidth,
              // height: 9,
              // width: 9,
            ),
            SizedBox(height: Const.space15),
            AutoSizeText(
              product!.name!,
              style: theme.textTheme.headline3,
            ),
            SizedBox(height: Const.space12),
            AutoSizeText(
              NumberFormat.currency(symbol: '\$').format(product!.price),
              style: theme.textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
