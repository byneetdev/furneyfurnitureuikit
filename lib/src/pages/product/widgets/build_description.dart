part of '../product_page.dart';


class _BuildDescription extends StatelessWidget {
  const _BuildDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Description',
            style: theme.textTheme.headline3,
          ),
          SizedBox(height: Const.space8),
          AutoSizeText(
            product.description!,
            style: theme.textTheme.subtitle1,
          ),
          SizedBox(height: Const.space15),
          Row(
            children: [
              Container(
                width: Screens.width(context) / 4,
                child: AutoSizeText(
                  'Categories',
                  style: theme.textTheme.bodyText2,
                ),
              ),
              Text(
                ':',
                style: theme.textTheme.bodyText2,
              ),
              Spacer(),
              Container(
                  child: Center(child: Text(product.categories!.join(', '))))
            ],
          ),
          SizedBox(height: Const.space12),
          Row(
            children: [
              Container(
                width: Screens.width(context) / 4,
                child: AutoSizeText(
                  'Tags',
                  style: theme.textTheme.bodyText2,
                ),
              ),
              Text(
                ':',
                style: theme.textTheme.bodyText2,
              ),
              Spacer(),
              Container(child: Center(child: Text(product.tags!.join(', '))))
            ],
          ),
        ],
      ),
    );
  }
}
