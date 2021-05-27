part of '../product_page.dart';

class _BuildSimiliarProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Const.margin),
          child: AutoSizeText(
            'Similiar Product',
            style: theme.textTheme.headline3,
          ),
        ),
        SizedBox(height: Const.space12),
        StaggeredGridView.countBuilder(
          itemCount: ProductList.bestSellerList.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          itemBuilder: (context, index) {
            var product = ProductList.bestSellerList[index];
            return ProductCard(
              product: product,
              cardType: ProductCardType.Grid,
            );
          },
        ),
      ],
    );
  }
}
