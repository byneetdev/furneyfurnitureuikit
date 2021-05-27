part of '../home_page.dart';

class _BuildSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: Screens.width(context),
      height: Screens.width(context) / 2,
      margin: EdgeInsets.symmetric(horizontal: Const.margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        // color: Colors.black,
      ),
      child: Swiper(
        itemCount: SwiperList.swiperList.length,
        autoplay: true,
        itemBuilder: (context, index) {
          ProductModel data = SwiperList.swiperList[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: CachedNetworkImageProvider(data.images!.first),
              ),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black87,
                        Colors.black26,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: Const.margin,
                  right: Const.margin,
                  bottom: Const.margin,
                  child: Container(
                    width: Screens.width(context) / 8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Cyber Furniture',
                          style: theme.textTheme.subtitle2
                              ?.copyWith(color: theme.highlightColor),
                        ),
                        Text(
                          'Sale Up To 70% Off',
                          style: theme.textTheme.headline1!
                              .copyWith(color: Colors.white),
                        ),
                        SizedBox(height: 8.0),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO: Navigate to Product Detail
                            },
                            style: ElevatedButton.styleFrom(
                              primary: theme.highlightColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    Const.GLOBAL_RADIUS),
                              ),
                            ),
                            child: AutoSizeText(
                              'Shop Now',
                              maxLines: 1,
                              style: theme.textTheme.subtitle2?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
