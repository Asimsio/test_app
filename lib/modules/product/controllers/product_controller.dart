import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repositories/product_repository.dart';

class ProductController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ProductRepository _repository;

  ProductController(this._repository);

  late AnimationController animationController;
  final RxBool isDarkMode = false.obs;
  final RxString searchTerm = ''.obs;
  final RxString selectedCategory = 'all'.obs;
  final RxString sortBy = 'name'.obs;
  final RxBool isAscending = true.obs;
  final RxSet<int> favorites = <int>{}.obs;
  final RxInt currentIndex = 0.obs;
  final RxMap<int, Product> cartItems = <int, Product>{}.obs;

  final List<Product> products = [];
  final List<Map<String, String>> categories = [
    {'value': 'all', 'label': 'All Categories'},
    {'value': 'electronics', 'label': 'Electronics'},
    {'value': 'fashion', 'label': 'Fashion'},
    {'value': 'home', 'label': 'Home & Kitchen'},
  ];

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animationController.forward();
    products.addAll(_repository.getProducts());
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  List<Product> get filteredAndSortedProducts {
    List<Product> filtered = products.where((product) {
      bool matchesSearch = product.name
              .toLowerCase()
              .contains(searchTerm.value.toLowerCase()) ||
          product.description
              .toLowerCase()
              .contains(searchTerm.value.toLowerCase());
      bool matchesCategory =
          selectedCategory.value == 'all' || product.category == selectedCategory.value;
      return matchesSearch && matchesCategory;
    }).toList();

    filtered.sort((a, b) {
      dynamic aValue, bValue;
      switch (sortBy.value) {
        case 'name':
          aValue = a.name.toLowerCase();
          bValue = b.name.toLowerCase();
          break;
        case 'price':
          aValue = a.price;
          bValue = b.price;
          break;
        case 'rating':
          aValue = a.rating;
          bValue = b.rating;
          break;
        default:
          aValue = a.name.toLowerCase();
          bValue = b.name.toLowerCase();
      }

      if (isAscending.value) {
        return aValue.compareTo(bValue);
      } else {
        return bValue.compareTo(aValue);
      }
    });

    return filtered;
  }

  List<Product> get favoriteProducts {
    return products.where((product) => favorites.contains(product.id)).toList();
  }

  void toggleFavorite(int productId) {
    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }
  }

  void addToCart(Product product) {
    if (cartItems.containsKey(product.id)) {
      cartItems[product.id] = cartItems[product.id]!.copyWith(
        quantity: cartItems[product.id]!.quantity + 1,
      );
    } else {
      cartItems[product.id] = product.copyWith(quantity: 1);
    }
    Get.snackbar(
      'Added to Cart',
      '${product.name} added to cart',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      mainButton: TextButton(
        onPressed: () => removeFromCart(product.id),
        child: const Text('UNDO'),
      ),
    );
  }

  void removeFromCart(int productId) {
    if (cartItems.containsKey(productId)) {
      if (cartItems[productId]!.quantity > 1) {
        cartItems[productId] = cartItems[productId]!.copyWith(
          quantity: cartItems[productId]!.quantity - 1,
        );
      } else {
        cartItems.remove(productId);
      }
    }
  }

  double get cartTotal {
    return cartItems.values.fold(
        0, (total, product) => total + (product.price * product.quantity));
  }

  void toggleTheme() {
    isDarkMode.toggle();
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'electronics':
        return Colors.blue;
      case 'fashion':
        return Colors.purple;
      case 'home':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}