import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/modules/product/views/widgets/cart_item_card.dart';
import 'package:test_app/modules/product/views/widgets/product_card.dart';
import '../controllers/product_controller.dart';

class ProductCatalogScreen extends GetView<ProductController> {
  const ProductCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Theme(
        data: controller.isDarkMode.value
            ? ThemeData.dark(useMaterial3: true).copyWith(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.dark,
                ),
              )
            : ThemeData.light(useMaterial3: true).copyWith(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.light,
                ),
              ),
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(Icons.shopping_bag, color: Colors.blue),
                const SizedBox(width: 8),
                const Text(
                  'Product_Test_App',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: controller.toggleTheme,
                icon: Obx(() => Icon(controller.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode)),
                tooltip:
                    controller.isDarkMode.value ? 'Light Mode' : 'Dark Mode',
              ),
              if (controller.currentIndex.value == 2 &&
                  controller.cartItems.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Obx(() => Text(
                          '\$${controller.cartTotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ),
            ],
            elevation: 0,
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: [
              _buildCatalogScreen(),
              _buildFavoritesScreen(),
              _buildCartScreen(),
            ],
          ),
          bottomNavigationBar: Obx(() {
            return BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) => controller.currentIndex.value = index,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: 'Catalog',
                  backgroundColor: controller.isDarkMode.value
                      ? Colors.grey[900]
                      : Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  label: 'Favorites',
                  backgroundColor: controller.isDarkMode.value
                      ? Colors.grey[900]
                      : Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Obx(() => Badge(
                        label: Text(controller.cartItems.length.toString()),
                        isLabelVisible: controller.cartItems.isNotEmpty,
                        child: const Icon(Icons.shopping_cart),
                      )),
                  label: 'Cart',
                  backgroundColor: controller.isDarkMode.value
                      ? Colors.grey[900]
                      : Colors.white,
                ),
              ],
            );
          }),
        ),
      );
    });
  }

  Widget _buildCatalogScreen() {
    return Column(
      children: [
        // Search and Filter Section
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search Bar
              // TextField(
              //   onChanged: (value) => controller.searchTerm.value = value,
              //   decoration: InputDecoration(
              //     hintText: 'Search products...',
              //     prefixIcon: const Icon(Icons.search),
              //     suffixIcon: Obx(() => controller.searchTerm.isNotEmpty
              //         ? IconButton(
              //             icon: const Icon(Icons.clear),
              //             onPressed: () => controller.searchTerm.value = '',
              //           )
              //         : null),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     filled: true,
              //     fillColor: controller.isDarkMode.value
              //         ? Colors.grey[800]
              //         : Colors.grey[100],
              //   ),
              // ),

              TextField(
                onChanged: (value) => controller.searchTerm.value = value,
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Obx(() {
                    return controller.searchTerm.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () => controller.searchTerm.value = '',
                          )
                        : const SizedBox.shrink();
                  }),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: controller.isDarkMode.value
                      ? Colors.grey[800]
                      : Colors.grey[100],
                ),
              ),

              const SizedBox(height: 16),
              // Filter Controls
              Row(
                children: [
                  // Category Dropdown
                  Expanded(
                    flex: 2,
                    child: Obx(() {
                      return DropdownButtonFormField<String>(
                        value: controller.selectedCategory.value,
                        onChanged: (value) =>
                            controller.selectedCategory.value = value!,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: controller.isDarkMode.value
                              ? Colors.grey[800]
                              : Colors.grey[100],
                        ),
                        items: controller.categories.map((category) {
                          return DropdownMenuItem<String>(
                            value: category['value'],
                            child: Text(category['label']!),
                          );
                        }).toList(),
                      );
                    }),
                  ),
                  const SizedBox(width: 12),
                  // Sort Dropdown
                  Expanded(
                    flex: 2,
                    child: Obx(() {
                      return DropdownButtonFormField<String>(
                        value: controller.sortBy.value,
                        onChanged: (value) => controller.sortBy.value = value!,
                        decoration: InputDecoration(
                          labelText: 'Sort By',
                          prefixIcon: const Icon(Icons.sort),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: controller.isDarkMode.value
                              ? Colors.grey[800]
                              : Colors.grey[100],
                        ),
                        items: const [
                          DropdownMenuItem(value: 'name', child: Text('Name')),
                          DropdownMenuItem(
                              value: 'price', child: Text('Price')),
                          DropdownMenuItem(
                              value: 'rating', child: Text('Rating')),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(width: 12),
                  // Sort Order Button
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        onPressed: () => controller.isAscending.toggle(),
                        icon: Icon(
                          controller.isAscending.value
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        tooltip: controller.isAscending.value
                            ? 'Ascending'
                            : 'Descending',
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        // Results Count
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Obx(() {
              return Text(
                'Showing ${controller.filteredAndSortedProducts.length} of ${controller.products.length} products',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        // Products Grid
        //   Expanded(
        //     child: Obx(() {
        //       final filteredProducts = controller.filteredAndSortedProducts;
        //       return filteredProducts.isEmpty
        //           ? Center(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon(
        //                     Icons.search_off,
        //                     size: 80,
        //                     color: Colors.grey[400],
        //                   ),
        //                   const SizedBox(height: 16),
        //                   Text(
        //                     'No products found',
        //                     style: TextStyle(
        //                       fontSize: 18,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.grey[600],
        //                     ),
        //                   ),
        //                   const SizedBox(height: 8),
        //                   Text(
        //                     'Try adjusting your search or filter criteria',
        //                     style: TextStyle(
        //                       color: Colors.grey[500],
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             )
        //           : GridView.builder(
        //               padding: const EdgeInsets.all(12),
        //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount:
        //                     MediaQuery.of(context).size.width > 600 ? 3 : 2,
        //                 childAspectRatio: 0.55,
        //                 crossAxisSpacing: 12,
        //                 mainAxisSpacing: 16,
        //               ),
        //               itemCount: filteredProducts.length,
        //               itemBuilder: (context, index) {
        //                 return AnimatedBuilder(
        //                   animation: controller.animationController,
        //                   builder: (context, child) {
        //                     return SlideTransition(
        //                       position: Tween<Offset>(
        //                         begin: const Offset(0, 0.3),
        //                         end: Offset.zero,
        //                       ).animate(CurvedAnimation(
        //                         parent: controller.animationController,
        //                         curve: Interval(
        //                           (index / filteredProducts.length) * 0.5,
        //                           ((index + 1) / filteredProducts.length) * 0.5 +
        //                               0.5,
        //                           curve: Curves.easeOut,
        //                         ),
        //                       )),
        //                       child: FadeTransition(
        //                         opacity: CurvedAnimation(
        //                           parent: controller.animationController,
        //                           curve: Interval(
        //                             (index / filteredProducts.length) * 0.5,
        //                             ((index + 1) / filteredProducts.length) *
        //                                     0.5 +
        //                                 0.5,
        //                             curve: Curves.easeOut,
        //                           ),
        //                         ),
        //                         child: ProductCard(
        //                           product: filteredProducts[index],
        //                           controller: controller,
        //                         ),
        //                       ),
        //                     );
        //                   },
        //                 );
        //               },
        //             );
        //     }),
        //   ),
        //

        Expanded(
          child: Builder(
            builder: (context) {
              return Obx(() {
                final filteredProducts = controller.filteredAndSortedProducts;
                return filteredProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No products found',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Try adjusting your search or filter criteria',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 3 : 2,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          return AnimatedBuilder(
                            animation: controller.animationController,
                            builder: (context, child) {
                              return SlideTransition(
                                position: Tween<Offset>(
                                  begin: const Offset(0, 0.3),
                                  end: Offset.zero,
                                ).animate(CurvedAnimation(
                                  parent: controller.animationController,
                                  curve: Interval(
                                    (index / filteredProducts.length) * 0.5,
                                    ((index + 1) / filteredProducts.length) *
                                            0.5 +
                                        0.5,
                                    curve: Curves.easeOut,
                                  ),
                                )),
                                child: FadeTransition(
                                  opacity: CurvedAnimation(
                                    parent: controller.animationController,
                                    curve: Interval(
                                      (index / filteredProducts.length) * 0.5,
                                      ((index + 1) / filteredProducts.length) *
                                              0.5 +
                                          0.5,
                                      curve: Curves.easeOut,
                                    ),
                                  ),
                                  child: ProductCard(
                                    product: filteredProducts[index],
                                    controller: controller,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFavoritesScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Favorites',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      controller.isDarkMode.value ? Colors.white : Colors.black,
                ),
              ),
              Obx(() {
                return Chip(
                  label: Text(
                    '${controller.favoriteProducts.length} items',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.blue,
                );
              }),
            ],
          ),
        ),
        // Expanded(
        //   child: Obx(() {
        //     final favoriteProducts = controller.favoriteProducts;
        //     return favoriteProducts.isEmpty
        //         ? Center(
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: [
        //                 Icon(
        //                   Icons.favorite_border,
        //                   size: 80,
        //                   color: Colors.grey[400],
        //                 ),
        //                 const SizedBox(height: 16),
        //                 Text(
        //                   'No favorites yet',
        //                   style: TextStyle(
        //                     fontSize: 18,
        //                     fontWeight: FontWeight.bold,
        //                     color: Colors.grey[600],
        //                   ),
        //                 ),
        //                 const SizedBox(height: 8),
        //                 Text(
        //                   'Tap the heart icon to add products to favorites',
        //                   style: TextStyle(
        //                     color: Colors.grey[500],
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           )
        //         : GridView.builder(
        //             padding: const EdgeInsets.all(12),
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount:
        //                   MediaQuery.of(context).size.width > 600 ? 3 : 2,
        //               childAspectRatio: 0.55,
        //               crossAxisSpacing: 12,
        //               mainAxisSpacing: 16,
        //             ),
        //             itemCount: favoriteProducts.length,
        //             itemBuilder: (context, index) {
        //               return ProductCard(
        //                 product: favoriteProducts[index],
        //                 controller: controller,
        //               );
        //             },
        //           );
        //   }),
        // ),

        Expanded(
          child: Builder(
            builder: (context) {
              return Obx(() {
                final favoriteProducts = controller.favoriteProducts;
                return favoriteProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite_border,
                              size: 80,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No favorites yet',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap the heart icon to add products to favorites',
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              MediaQuery.of(context).size.width > 600 ? 3 : 2,
                          childAspectRatio: 0.55,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: favoriteProducts.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: favoriteProducts[index],
                            controller: controller,
                          );
                        },
                      );
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCartScreen() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      controller.isDarkMode.value ? Colors.white : Colors.black,
                ),
              ),
              Obx(() {
                return Chip(
                  label: Text(
                    '${controller.cartItems.length} items',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.blue,
                );
              }),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            return controller.cartItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your cart is empty',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add products to your cart to see them here',
                          style: TextStyle(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return ListView.builder(
                            itemCount: controller.cartItems.length,
                            itemBuilder: (context, index) {
                              final product =
                                  controller.cartItems.values.toList()[index];
                              return CartItemCard(
                                product: product,
                                controller: controller,
                              );
                            },
                          );
                        }),
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: controller.isDarkMode.value
                              ? Colors.grey[800]
                              : Colors.grey[100],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, -4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: controller.isDarkMode.value
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Obx(() {
                                  return Text(
                                    '\$${controller.cartTotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  );
                                }),
                              ],
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.snackbar(
                                    'Order Placed',
                                    'Order placed successfully!',
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Checkout',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
          }),
        ),
      ],
    );
  }
}
