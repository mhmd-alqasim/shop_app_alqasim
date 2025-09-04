import 'package:flutter/material.dart';

Widget buildBottomBar(context, dynamic product) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
        // topLeft: Radius.circular(20),
        // topRight: Radius.circular(20),
      ),
      boxShadow: [
        BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -3)),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Price', style: TextStyle(fontSize: 14, color: Colors.grey)),
            Text(
              'SYP${product.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            if (product.oldPrice != null && product.oldPrice != product.price)
              Text(
                'SYP${product.oldPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 255, 0, 0),
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // حدث زر إضافة للسلة
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(width: 8),
            // IconButton(
            //   onPressed: () {
            //     // ShopAppCubit.get(context).setFavorite(product.id);
            //   },
            //   icon: const Icon(Icons.favorite_border),
            //   color: (ShopAppCubit.get(context).favorait[product.id] ?? false)
            //       ? Colors.red
            //       : Colors.grey,
            // ),
          ],
        ),
      ],
    ),
  );
}
