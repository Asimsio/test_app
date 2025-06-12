import '../models/product_model.dart';

abstract class ProductRepository {
  List<Product> getProducts();
}