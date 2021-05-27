part of '../home_page.dart';


class _CategoryCard extends StatelessWidget {
  final CategoryModel? category;
  final VoidCallback? onCategoryTap;

  const _CategoryCard({Key? key, this.category, this.onCategoryTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 70.0,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: EdgeInsets.all(7.0),
      margin: EdgeInsets.only(right: Const.space15),
      child: InkWell(
        onTap: onCategoryTap,
        child: Column(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundColor: theme.backgroundColor,
              child: SvgPicture.asset(category!.icon!),
            ),
            Spacer(),
            AutoSizeText(
              category!.name!,
              style: theme.textTheme.subtitle2,
              minFontSize: 12,
              maxFontSize: 14,
              softWrap: true,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
