part of '../product_page.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _swiperIndex = 0;
  ProductModel? product;

  @override
  void initState(){
    super.initState();
    product = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _BuildAppBar(
            product: product,
            swiperIndex: _swiperIndex,
            onFavoriteTap: () {
              //TODO:
            },
            onIndexChanged: (v) {
              setState(() => _swiperIndex = v);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: Const.space25),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 800),
                  child: _BuildName(product: product!),
                ),
                SizedBox(height: Const.space15),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 900),
                  child: _BuildPriceAndRating(product: product!),
                ),
                Divider(color: theme.hintColor),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 1000),
                  child: _BuildColors(),
                ),
                Divider(color: theme.hintColor),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 1100),
                  child: _BuildDescription(product: product!),
                ),
                Divider(color: theme.hintColor),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 1200),
                  child: _BuildReviews(),
                ),
                Divider(color: theme.hintColor),
                CustomShakeTransition(
                  duration: Duration(milliseconds: 1300),
                  child: _BuildSimiliarProductList(),
                ),
                SizedBox(height: 100.0),
              ],
            ),
          )
        ],
      ),
      bottomSheet: Container(
        color: theme.backgroundColor,
        padding: const EdgeInsets.fromLTRB(
          Const.margin,
          0.0,
          Const.margin,
          Const.margin,
        ),
        child: CustomElevatedButton(
          onTap: () {
            //TODO: ADD TO CART
          },
          label: 'Add to Cart',
        ),
      ),
    );
  }
}
