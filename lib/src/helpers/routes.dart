import 'package:furneyfurnitureuikit/src/pages/product/product_page.dart';
import 'package:get/get.dart';

import '../pages/home/home_page.dart';
import 'constants.dart';


List<GetPage> allRoutes = [
  GetPage(name: Routes.home, page: () => HomeScreen()),
  GetPage(name: Routes.product, page: () => ProductScreen()),
];
