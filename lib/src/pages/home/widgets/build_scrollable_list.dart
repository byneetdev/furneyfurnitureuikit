part of '../home_page.dart';

class _BuildScrollableList extends StatelessWidget {
  final List<ProductModel>? itemCount;

  const _BuildScrollableList({Key? key, this.itemCount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screens.width(context),
      height: 220.0,
      child: ListView.builder(
        itemCount: itemCount?.length,
        padding: EdgeInsets.only(left: Const.margin),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          ProductModel data = itemCount![index];
          return ProductCard(product: data);
        },
      ),
    );
  }
}
