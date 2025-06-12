import 'package:get/get.dart';
import 'package:test_app/main.dart';
import 'package:test_app/modules/product/bindings/product_binding.dart';
import 'package:test_app/modules/product/views/product_catalog_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.productCatalog;

  static final routes = [
    GetPage(
      name: Routes.productCatalog,
      page: () => const ProductCatalogScreen(),
      binding: ProductBinding(),
    ),
  ];
}