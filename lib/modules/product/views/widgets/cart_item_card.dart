import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/data/models/product_model.dart';
import '../../controllers/product_controller.dart';

class CartItemCard extends StatelessWidget {
  final Product product;
  final ProductController controller;

  const CartItemCard({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                product.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () => controller.removeFromCart(product.id),
                ),
                Obx(() {
                  return Text(
                    controller.cartItems[product.id]?.quantity.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => controller.addToCart(product),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}