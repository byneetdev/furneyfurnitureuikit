part of '../product_page.dart';

class _BuildAppBar extends StatelessWidget {
  final ProductModel? product;
  final int? swiperIndex;
  final VoidCallback? onFavoriteTap;
  final ValueChanged<int>? onIndexChanged;

  const _BuildAppBar(
      {Key? key,
      this.product,
      this.swiperIndex,
      this.onFavoriteTap,
      this.onIndexChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      backgroundColor: theme.backgroundColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Get.back(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.favorite),
          color: Colors.red,
          onPressed: () {
            //TODO:
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Swiper(
              itemCount: product!.images!.length,
              autoplay: false,
              onIndexChanged: onIndexChanged,
              itemBuilder: (context, index) {
                var data = product!.images![index];
                return CustomNetworkImage(
                  image: data,
                  borderRadius: BorderRadius.zero,
                );
              },
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: CustomDotsIndicator(
                dotsCount: product!.images,
                position: swiperIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
