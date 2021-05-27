part of '../home_page.dart';

class _BuildCategoryList extends StatelessWidget {
  const _BuildCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screens.width(context),
      height: 100.0,
      child: ListView.builder(
        itemCount: CategoryList.topCategoryList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Const.margin),
        itemBuilder: (context, index) {
          CategoryModel data = CategoryList.topCategoryList[index];

          return _CategoryCard(
            category: data,
            onCategoryTap: () {
              //TODO: Navigate to All Product by Category
            }
          );
        },
      ),
    );
  }
}
