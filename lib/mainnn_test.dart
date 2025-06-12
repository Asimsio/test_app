// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   static const String _title = 'Flutter Stateful Clicker Counter';
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       theme: ThemeData(
//         // useMaterial3: false,
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//   // This class is the configuration for the state.
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: const Text('Flutter Demo Click Counter'),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: const TextStyle(fontSize: 25),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const ProductCatalogApp());
// }

// class ProductCatalogApp extends StatelessWidget {
//   const ProductCatalogApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ProductHub',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.light,
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.light,
//         ),
//       ),
//       darkTheme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark,
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.blue,
//           brightness: Brightness.dark,
//         ),
//       ),
//       home: const ProductCatalogScreen(),
//     );
//   }
// }

// class Product {
//   final int id;
//   final String name;
//   final double price;
//   final String category;
//   final String image;
//   final double rating;
//   final String description;
//   int quantity;

//   Product({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.category,
//     required this.image,
//     required this.rating,
//     required this.description,
//     this.quantity = 0,
//   });

//   Product copyWith({
//     int? id,
//     String? name,
//     double? price,
//     String? category,
//     String? image,
//     double? rating,
//     String? description,
//     int? quantity,
//   }) {
//     return Product(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       price: price ?? this.price,
//       category: category ?? this.category,
//       image: image ?? this.image,
//       rating: rating ?? this.rating,
//       description: description ?? this.description,
//       quantity: quantity ?? this.quantity,
//     );
//   }
// }

// class ProductCatalogScreen extends StatefulWidget {
//   const ProductCatalogScreen({super.key});

//   @override
//   State<ProductCatalogScreen> createState() => _ProductCatalogScreenState();
// }

// class _ProductCatalogScreenState extends State<ProductCatalogScreen>
//     with TickerProviderStateMixin {
//   bool _isDarkMode = false;
//   String _searchTerm = '';
//   String _selectedCategory = 'all';
//   String _sortBy = 'name';
//   bool _isAscending = true;
//   Set<int> _favorites = <int>{};
//   late AnimationController _animationController;
//   int _currentIndex = 0;
//   Map<int, Product> _cartItems = {};

//   final List<Product> _products = [
//     Product(
//       id: 1,
//       name: "iPhone 15 Pro",
//       price: 999.0,
//       category: "electronics",
//       image:
//           "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.8,
//       description: "Latest iPhone with titanium design",
//     ),
//     Product(
//       id: 2,
//       name: "MacBook Air M3",
//       price: 1299.0,
//       category: "electronics",
//       image:
//           "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.9,
//       description: "Powerful laptop for professionals",
//     ),
//     Product(
//       id: 3,
//       name: "Nike Air Jordan",
//       price: 180.0,
//       category: "fashion",
//       image:
//           "https://images.unsplash.com/photo-1556906781-9a412961c28c?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.6,
//       description: "Classic basketball sneakers",
//     ),
//     Product(
//       id: 4,
//       name: "Sony WH-1000XM5",
//       price: 349.0,
//       category: "electronics",
//       image:
//           "https://images.unsplash.com/photo-1583394838336-acd977736f90?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.7,
//       description: "Premium noise canceling headphones",
//     ),
//     Product(
//       id: 5,
//       name: "Levi's 501 Jeans",
//       price: 89.0,
//       category: "fashion",
//       image:
//           "https://images.unsplash.com/photo-1542272604-787c3835535d?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.4,
//       description: "Classic straight leg jeans",
//     ),
//     Product(
//       id: 6,
//       name: "Instant Pot Duo",
//       price: 129.0,
//       category: "home",
//       image:
//           "https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.5,
//       description: "Multi-use pressure cooker",
//     ),
//     Product(
//       id: 7,
//       name: "Adidas Ultraboost",
//       price: 220.0,
//       category: "fashion",
//       image:
//           "https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.6,
//       description: "High-performance running shoes",
//     ),
//     Product(
//       id: 8,
//       name: "iPad Pro 12.9",
//       price: 1099.0,
//       category: "electronics",
//       image:
//           "https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.8,
//       description: "Professional tablet for creativity",
//     ),
//     Product(
//       id: 9,
//       name: "KitchenAid Mixer",
//       price: 399.0,
//       category: "home",
//       image:
//           "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.7,
//       description: "Professional stand mixer",
//     ),
//     Product(
//       id: 10,
//       name: "Ray-Ban Aviator",
//       price: 154.0,
//       category: "fashion",
//       image:
//           "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.5,
//       description: "Classic aviator sunglasses",
//     ),
//     Product(
//       id: 11,
//       name: "Dyson V15 Vacuum",
//       price: 749.0,
//       category: "home",
//       image:
//           "https://images.unsplash.com/photo-1558618047-3c8c76ca7d13?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.6,
//       description: "Cordless stick vacuum cleaner",
//     ),
//     Product(
//       id: 12,
//       name: "Canon EOS R5",
//       price: 3899.0,
//       category: "electronics",
//       image:
//           "https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=800&h=800&fit=crop&crop=center&auto=format&q=80",
//       rating: 4.9,
//       description: "Professional mirrorless camera",
//     ),
//   ];

//   final List<Map<String, String>> _categories = [
//     {'value': 'all', 'label': 'All Categories'},
//     {'value': 'electronics', 'label': 'Electronics'},
//     {'value': 'fashion', 'label': 'Fashion'},
//     {'value': 'home', 'label': 'Home & Kitchen'},
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//     _animationController.forward();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   List<Product> get _filteredAndSortedProducts {
//     List<Product> filtered = _products.where((product) {
//       bool matchesSearch = product.name
//               .toLowerCase()
//               .contains(_searchTerm.toLowerCase()) ||
//           product.description.toLowerCase().contains(_searchTerm.toLowerCase());
//       bool matchesCategory =
//           _selectedCategory == 'all' || product.category == _selectedCategory;
//       return matchesSearch && matchesCategory;
//     }).toList();

//     filtered.sort((a, b) {
//       dynamic aValue, bValue;
//       switch (_sortBy) {
//         case 'name':
//           aValue = a.name.toLowerCase();
//           bValue = b.name.toLowerCase();
//           break;
//         case 'price':
//           aValue = a.price;
//           bValue = b.price;
//           break;
//         case 'rating':
//           aValue = a.rating;
//           bValue = b.rating;
//           break;
//         default:
//           aValue = a.name.toLowerCase();
//           bValue = b.name.toLowerCase();
//       }

//       if (_isAscending) {
//         return aValue.compareTo(bValue);
//       } else {
//         return bValue.compareTo(aValue);
//       }
//     });

//     return filtered;
//   }

//   List<Product> get _favoriteProducts {
//     return _products
//         .where((product) => _favorites.contains(product.id))
//         .toList();
//   }

//   void _toggleFavorite(int productId) {
//     setState(() {
//       if (_favorites.contains(productId)) {
//         _favorites.remove(productId);
//       } else {
//         _favorites.add(productId);
//       }
//     });
//   }

//   void _addToCart(Product product) {
//     setState(() {
//       if (_cartItems.containsKey(product.id)) {
//         _cartItems[product.id] = _cartItems[product.id]!.copyWith(
//           quantity: _cartItems[product.id]!.quantity + 1,
//         );
//       } else {
//         _cartItems[product.id] = product.copyWith(quantity: 1);
//       }
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('${product.name} added to cart'),
//         duration: const Duration(seconds: 2),
//         action: SnackBarAction(
//           label: 'UNDO',
//           onPressed: () {
//             setState(() {
//               if (_cartItems[product.id]!.quantity > 1) {
//                 _cartItems[product.id] = _cartItems[product.id]!.copyWith(
//                   quantity: _cartItems[product.id]!.quantity - 1,
//                 );
//               } else {
//                 _cartItems.remove(product.id);
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }

//   void _removeFromCart(int productId) {
//     setState(() {
//       if (_cartItems.containsKey(productId)) {
//         if (_cartItems[productId]!.quantity > 1) {
//           _cartItems[productId] = _cartItems[productId]!.copyWith(
//             quantity: _cartItems[productId]!.quantity - 1,
//           );
//         } else {
//           _cartItems.remove(productId);
//         }
//       }
//     });
//   }

//   double get _cartTotal {
//     return _cartItems.values.fold(
//         0, (total, product) => total + (product.price * product.quantity));
//   }

//   void _toggleTheme() {
//     setState(() {
//       _isDarkMode = !_isDarkMode;
//     });
//   }

//   Widget _buildStarRating(double rating) {
//     List<Widget> stars = [];
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;

//     for (int i = 0; i < fullStars; i++) {
//       stars.add(const Icon(Icons.star, color: Colors.amber, size: 16));
//     }

//     if (hasHalfStar) {
//       stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 16));
//     }

//     int remainingStars = 5 - stars.length;
//     for (int i = 0; i < remainingStars; i++) {
//       stars.add(Icon(Icons.star_border, color: Colors.grey[400], size: 16));
//     }

//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: stars,
//     );
//   }

//   Widget _buildProductCard(Product product) {
//     return Card(
//       elevation: 4,
//       margin: const EdgeInsets.all(8),
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('${product.name} selected'),
//               duration: const Duration(seconds: 1),
//             ),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image
//             Stack(
//               children: [
//                 Container(
//                   height: 140,
//                   width: double.infinity,
//                   child: ClipRRect(
//                     borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(8)),
//                     child: Image.network(
//                       product.image,
//                       fit: BoxFit.cover,
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(8)),
//                           ),
//                           child: Center(
//                             child: CircularProgressIndicator(
//                               value: loadingProgress.expectedTotalBytes != null
//                                   ? loadingProgress.cumulativeBytesLoaded /
//                                       loadingProgress.expectedTotalBytes!
//                                   : null,
//                             ),
//                           ),
//                         );
//                       },
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           height: 140,
//                           decoration: BoxDecoration(
//                             color: Colors.grey[300],
//                             borderRadius: const BorderRadius.vertical(
//                                 top: Radius.circular(8)),
//                           ),
//                           child: const Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.image_not_supported,
//                                 size: 40,
//                                 color: Colors.grey,
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 'Image unavailable',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       headers: const {
//                         'Cache-Control': 'max-age=3600',
//                       },
//                     ),
//                   ),
//                 ),
//                 // Category Badge
//                 Positioned(
//                   top: 8,
//                   left: 8,
//                   child: Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: _getCategoryColor(product.category),
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: Text(
//                       product.category.toUpperCase(),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Favorite Button
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white.withOpacity(0.9),
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       onPressed: () => _toggleFavorite(product.id),
//                       iconSize: 20,
//                       padding: const EdgeInsets.all(8),
//                       constraints: const BoxConstraints(),
//                       icon: Icon(
//                         _favorites.contains(product.id)
//                             ? Icons.favorite
//                             : Icons.favorite_border,
//                         color: _favorites.contains(product.id)
//                             ? Colors.red
//                             : Colors.grey[600],
//                         size: 18,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Product Info
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       product.name,
//                       style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       product.description,
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey[600],
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         _buildStarRating(product.rating),
//                         const SizedBox(width: 4),
//                         Text(
//                           '(${product.rating})',
//                           style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey[600],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Spacer(),
//                     Text(
//                       '\$${product.price.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: _getCategoryColor(product.category),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: () => _addToCart(product),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: _getCategoryColor(product.category),
//                           foregroundColor: Colors.white,
//                           padding: const EdgeInsets.symmetric(vertical: 12),
//                           textStyle: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         child: const Text('Add to Cart'),
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCartItemCard(Product product) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 product.image,
//                 width: 60,
//                 height: 60,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     '\$${product.price.toStringAsFixed(2)}',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.remove),
//                   onPressed: () => _removeFromCart(product.id),
//                 ),
//                 Text(
//                   product.quantity.toString(),
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.add),
//                   onPressed: () => _addToCart(product),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Color _getCategoryColor(String category) {
//     switch (category) {
//       case 'electronics':
//         return Colors.blue;
//       case 'fashion':
//         return Colors.purple;
//       case 'home':
//         return Colors.green;
//       default:
//         return Colors.blue;
//     }
//   }

//   Widget _buildCatalogScreen() {
//     final filteredProducts = _filteredAndSortedProducts;

//     return Column(
//       children: [
//         // Search and Filter Section
//         Container(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               // Search Bar
//               TextField(
//                 onChanged: (value) => setState(() => _searchTerm = value),
//                 decoration: InputDecoration(
//                   hintText: 'Search products...',
//                   prefixIcon: const Icon(Icons.search),
//                   suffixIcon: _searchTerm.isNotEmpty
//                       ? IconButton(
//                           icon: const Icon(Icons.clear),
//                           onPressed: () => setState(() => _searchTerm = ''),
//                         )
//                       : null,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   filled: true,
//                   fillColor: _isDarkMode ? Colors.grey[800] : Colors.grey[100],
//                 ),
//               ),
//               const SizedBox(height: 16),
//               // Filter Controls
//               Row(
//                 children: [
//                   // Category Dropdown
//                   Expanded(
//                     flex: 2,
//                     child: DropdownButtonFormField<String>(
//                       value: _selectedCategory,
//                       onChanged: (value) =>
//                           setState(() => _selectedCategory = value!),
//                       decoration: InputDecoration(
//                         labelText: 'Category',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         filled: true,
//                         fillColor:
//                             _isDarkMode ? Colors.grey[800] : Colors.grey[100],
//                       ),
//                       items: _categories.map((category) {
//                         return DropdownMenuItem<String>(
//                           value: category['value'],
//                           child: Text(category['label']!),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   // Sort Dropdown
//                   Expanded(
//                     flex: 2,
//                     child: DropdownButtonFormField<String>(
//                       value: _sortBy,
//                       onChanged: (value) => setState(() => _sortBy = value!),
//                       decoration: InputDecoration(
//                         labelText: 'Sort By',
//                         prefixIcon: const Icon(Icons.sort),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         filled: true,
//                         fillColor:
//                             _isDarkMode ? Colors.grey[800] : Colors.grey[100],
//                       ),
//                       items: const [
//                         DropdownMenuItem(value: 'name', child: Text('Name')),
//                         DropdownMenuItem(value: 'price', child: Text('Price')),
//                         DropdownMenuItem(
//                             value: 'rating', child: Text('Rating')),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   // Sort Order Button
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.blue,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: IconButton(
//                       onPressed: () =>
//                           setState(() => _isAscending = !_isAscending),
//                       icon: Icon(
//                         _isAscending
//                             ? Icons.arrow_upward
//                             : Icons.arrow_downward,
//                         color: Colors.white,
//                       ),
//                       tooltip: _isAscending ? 'Ascending' : 'Descending',
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         // Results Count
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               'Showing ${filteredProducts.length} of ${_products.length} products',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 14,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         // Products Grid
//         Expanded(
//           child: filteredProducts.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.search_off,
//                         size: 80,
//                         color: Colors.grey[400],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'No products found',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Try adjusting your search or filter criteria',
//                         style: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : GridView.builder(
//                   padding: const EdgeInsets.all(12),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount:
//                         MediaQuery.of(context).size.width > 600 ? 3 : 2,
//                     childAspectRatio: 0.55,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemCount: filteredProducts.length,
//                   itemBuilder: (context, index) {
//                     return AnimatedBuilder(
//                       animation: _animationController,
//                       builder: (context, child) {
//                         return SlideTransition(
//                           position: Tween<Offset>(
//                             begin: const Offset(0, 0.3),
//                             end: Offset.zero,
//                           ).animate(CurvedAnimation(
//                             parent: _animationController,
//                             curve: Interval(
//                               (index / filteredProducts.length) * 0.5,
//                               ((index + 1) / filteredProducts.length) * 0.5 +
//                                   0.5,
//                               curve: Curves.easeOut,
//                             ),
//                           )),
//                           child: FadeTransition(
//                             opacity: CurvedAnimation(
//                               parent: _animationController,
//                               curve: Interval(
//                                 (index / filteredProducts.length) * 0.5,
//                                 ((index + 1) / filteredProducts.length) * 0.5 +
//                                     0.5,
//                                 curve: Curves.easeOut,
//                               ),
//                             ),
//                             child: _buildProductCard(filteredProducts[index]),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildFavoritesScreen() {
//     final favoriteProducts = _favoriteProducts;

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'My Favorites',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: _isDarkMode ? Colors.white : Colors.black,
//                 ),
//               ),
//               Chip(
//                 label: Text(
//                   '${favoriteProducts.length} items',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 backgroundColor: Colors.blue,
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: favoriteProducts.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.favorite_border,
//                         size: 80,
//                         color: Colors.grey[400],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'No favorites yet',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Tap the heart icon to add products to favorites',
//                         style: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : GridView.builder(
//                   padding: const EdgeInsets.all(12),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount:
//                         MediaQuery.of(context).size.width > 600 ? 3 : 2,
//                     childAspectRatio: 0.55,
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemCount: favoriteProducts.length,
//                   itemBuilder: (context, index) {
//                     return _buildProductCard(favoriteProducts[index]);
//                   },
//                 ),
//         ),
//       ],
//     );
//   }

//   Widget _buildCartScreen() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'My Cart',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: _isDarkMode ? Colors.white : Colors.black,
//                 ),
//               ),
//               Chip(
//                 label: Text(
//                   '${_cartItems.length} items',
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 backgroundColor: Colors.blue,
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: _cartItems.isEmpty
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(
//                         Icons.shopping_cart_outlined,
//                         size: 80,
//                         color: Colors.grey[400],
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         'Your cart is empty',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         'Add products to your cart to see them here',
//                         style: TextStyle(
//                           color: Colors.grey[500],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               : Column(
//                   children: [
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: _cartItems.length,
//                         itemBuilder: (context, index) {
//                           final product = _cartItems.values.toList()[index];
//                           return _buildCartItemCard(product);
//                         },
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color:
//                             _isDarkMode ? Colors.grey[800] : Colors.grey[100],
//                         borderRadius: const BorderRadius.only(
//                           topLeft: Radius.circular(16),
//                           topRight: Radius.circular(16),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 8,
//                             offset: const Offset(0, -4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Total:',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color:
//                                       _isDarkMode ? Colors.white : Colors.black,
//                                 ),
//                               ),
//                               Text(
//                                 '\$${_cartTotal.toStringAsFixed(2)}',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text('Order placed successfully!'),
//                                     duration: Duration(seconds: 2),
//                                   ),
//                                 );
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.blue,
//                                 foregroundColor: Colors.white,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                               ),
//                               child: const Text(
//                                 'Checkout',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: _isDarkMode
//           ? ThemeData.dark(useMaterial3: true).copyWith(
//               colorScheme: ColorScheme.fromSeed(
//                 seedColor: Colors.blue,
//                 brightness: Brightness.dark,
//               ),
//             )
//           : ThemeData.light(useMaterial3: true).copyWith(
//               colorScheme: ColorScheme.fromSeed(
//                 seedColor: Colors.blue,
//                 brightness: Brightness.light,
//               ),
//             ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Row(
//             children: [
//               Icon(Icons.shopping_bag, color: Colors.blue),
//               const SizedBox(width: 8),
//               const Text(
//                 'ProductHub',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           actions: [
//             IconButton(
//               onPressed: _toggleTheme,
//               icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
//               tooltip: _isDarkMode ? 'Light Mode' : 'Dark Mode',
//             ),
//             if (_currentIndex == 2 && _cartItems.isNotEmpty)
//               Padding(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: Center(
//                   child: Text(
//                     '\$${_cartTotal.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//           elevation: 0,
//         ),
//         body: IndexedStack(
//           index: _currentIndex,
//           children: [
//             _buildCatalogScreen(),
//             _buildFavoritesScreen(),
//             _buildCartScreen(),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) => setState(() => _currentIndex = index),
//           selectedItemColor: Colors.blue,
//           unselectedItemColor: Colors.grey,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//           items: [
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: 'Catalog',
//               backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.favorite),
//               label: 'Favorites',
//               backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
//             ),
//             BottomNavigationBarItem(
//               icon: Badge(
//                 label: Text(_cartItems.length.toString()),
//                 isLabelVisible: _cartItems.isNotEmpty,
//                 child: const Icon(Icons.shopping_cart),
//               ),
//               label: 'Cart',
//               backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }