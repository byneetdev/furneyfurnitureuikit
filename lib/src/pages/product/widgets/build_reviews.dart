part of '../product_page.dart';

class _BuildReviews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Const.margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Reviews',
            style: theme.textTheme.headline3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AutoSizeText(
                0.toString() + " " + 'Reviews',
                style: theme.textTheme.subtitle2,
              ),
              AutoSizeText.rich(
                TextSpan(children: [
                  TextSpan(
                      text: 0.0.toString(), style: theme.textTheme.headline3),
                  TextSpan(
                      text: " " +
                          'Out of' +
                          " " +
                          5.0.toString(),
                      style: theme.textTheme.bodyText2),
                ]),
              ),
            ],
          ),
          //TODO: ADD Review Card
        ],
      ),
    );
  }
}
