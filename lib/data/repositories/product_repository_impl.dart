import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  List<Product> getProducts() {
    return [
      Product(
        id: 1,
        name: "iPhone 15 Pro",
        price: 999.0,
        category: "electronics",
        image: "https://images.unsplash.com/photo-1592750475338-74b7b21085ab",
        rating: 4.8,
        description: "Latest iPhone with titanium design",
      ),
       Product(
      id: 1,
      name: "iPhone 15 Pro",
      price: 999.0,
      category: "electronics",
      image:
          "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.8,
      description: "Latest iPhone with titanium design",
    ),
    Product(
      id: 2,
      name: "MacBook Air M3",
      price: 1299.0,
      category: "electronics",
      image:
          "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.9,
      description: "Powerful laptop for professionals",
    ),
    Product(
      id: 3,
      name: "Nike Air Jordan",
      price: 180.0,
      category: "fashion",
      image:
          "https://images.unsplash.com/photo-1556906781-9a412961c28c?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.6,
      description: "Classic basketball sneakers",
    ),
    Product(
      id: 4,
      name: "Sony WH-1000XM5",
      price: 349.0,
      category: "electronics",
      image:
          "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.7,
      description: "Premium noise canceling headphones",
    ),
    Product(
      id: 5,
      name: "Levi's 501 Jeans",
      price: 89.0,
      category: "fashion",
      image:
          "https://images.unsplash.com/photo-1542272604-787c3835535d?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.4,
      description: "Classic straight leg jeans",
    ),
    Product(
      id: 6,
      name: "Instant Pot Duo",
      price: 129.0,
      category: "home",
      image:
          "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.5,
      description: "Multi-use pressure cooker",
    ),
    Product(
      id: 7,
      name: "Adidas Ultraboost",
      price: 220.0,
      category: "fashion",
      image:
          "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.6,
      description: "High-performance running shoes",
    ),
    Product(
      id: 8,
      name: "iPad Pro 12.9",
      price: 1099.0,
      category: "electronics",
      image:
          "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.8,
      description: "Professional tablet for creativity",
    ),
    Product(
      id: 9,
      name: "KitchenAid Mixer",
      price: 399.0,
      category: "home",
      image:
          "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.7,
      description: "Professional stand mixer",
    ),
    Product(
      id: 10,
      name: "Ray-Ban Aviator",
      price: 154.0,
      category: "fashion",
      image:
          "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.5,
      description: "Classic aviator sunglasses",
    ),
    Product(
      id: 11,
      name: "Dyson V15 Vacuum",
      price: 749.0,
      category: "home",
      image:
          "https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.6,
      description: "Cordless stick vacuum cleaner",
    ),
    Product(
      id: 12,
      name: "Canon EOS R5",
      price: 3899.0,
      category: "electronics",
      image:
          "https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
      rating: 4.9,
      description: "Professional mirrorless camera",
    ),
      // Add all other products here...
    ];
  }
}