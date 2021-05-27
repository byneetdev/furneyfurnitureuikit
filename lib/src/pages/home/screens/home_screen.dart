part of '../home_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        enableLeading: false,
        actions: [
          IconButton(
            icon: Icon(FeatherIcons.bell),
            onPressed: () {
              context.read<ThemeProvider>().changeTheme();
            },
          )
        ],
      ),
      body: ListView(
        children: [
          CustomShakeTransition(
            duration: Duration(milliseconds: 700),
            child: _BuildSwiper(),
          ),
          SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: Duration(milliseconds: 800),
            child: _BuildLabelSection(
              label: 'Categories',
              onViewAllTap: () {
                //TODO: Navigate to All Category
              },
            ),
          ),
          SizedBox(height: Const.space12),
          CustomShakeTransition(
            duration: Duration(milliseconds: 900),
            child: _BuildCategoryList(),
          ),
          SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: Duration(milliseconds: 1000),
            child: _BuildLabelSection(
              label: 'Best Seller',
              onViewAllTap: () {
                //TODO: Navigate to All Best Seller
              },
            ),
          ),
          SizedBox(height: Const.space12),
          CustomShakeTransition(
            duration: Duration(milliseconds: 1100),
            child: _BuildScrollableList(
              itemCount: ProductList.bestSellerList,
            ),
          ),
          SizedBox(height: Const.space25),
          CustomShakeTransition(
            duration: Duration(milliseconds: 1200),
            child: _BuildLabelSection(
                label: 'Maybe you will Like',
                onViewAllTap: () {
                  //TODO: Navigate to All Products
                }),
          ),
          SizedBox(height: Const.space12),
          CustomShakeTransition(
            duration: Duration(milliseconds: 1300),
            child: _BuildVerticalList(
              itemCount: ProductList.bestSellerList,
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
