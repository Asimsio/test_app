import 'package:get/get.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../controllers/product_controller.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
      () => ProductController(ProductRepositoryImpl()),
    );
  }
}