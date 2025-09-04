import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildProductItem(BuildContext context, product) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ProductScreen(id: product.id),
      //   ),
      // );
    },
    child: Center(
      child: Card(
        elevation: 6,
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 200,
          height: 233,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProductImage(context, product),
                const SizedBox(height: 5.0),
                _buildProductInfo(context, product, false),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildProductItemHorizontal(BuildContext context, product) {
  return GestureDetector(
    onTap: () {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ProductScreen(id: product.id),
      //   ),
      // );
    },
    child: Center(
      child: Card(
        elevation: 6,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: SizedBox(
          width: 320,
          height: 160,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    SizedBox(
                      width: 140,
                      height: double.infinity,
                      child: _buildMainImage(product),
                    ),
                    if (_hasDiscount(product)) _buildDiscountBadge(),
                    _buildAddToCartButton(context),
                    _buildPriceTag(context, product),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildProductInfo(context, product, true),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildProductImage(context, product) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
    child: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        _buildMainImage(product),
        if (_hasDiscount(product)) _buildDiscountBadge(),
        _buildAddToCartButton(context),
        _buildPriceTag(context, product),
      ],
    ),
  );
}

Widget _buildMainImage(product) {
  return CachedNetworkImage(
    imageUrl: product!.mainImage,
    placeholder:
        (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
    height: 140,
    width: double.infinity,
    fit: BoxFit.cover,
  );
}

Widget _buildProductInfo(context, product, bool isHorizon) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              product.name.length < 25
                  ? product.name
                  : '${product.name.substring(0, 13)}...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.price}SP',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    if (product.oldPrice != null &&
                        product.oldPrice != product.price &&
                        product.oldPrice != '0.00')
                      Text(
                        'SPY${product.oldPrice}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ),
              // BlocConsumer<AppCubit, AppState>(
              //   listener: (context, state) {},
              //   builder: (context, state) {
              //     final cubit = AppCubit.get(context);

              //     final isFavorite = cubit.favorites[product.id] ?? false;

              //     return Expanded(
              //       flex: 1,
              //       child: GestureDetector(
              //         onTap: () {
              //           cubit.toggleFavorite(product.id);
              //         },
              //         child: Icon(
              //           Icons.favorite,
              //           // استخدم قيمة isFavorite لتحديد اللون
              //           color: isFavorite ? Colors.red : Colors.grey,
              //           size: 20,
              //         ),
              //       ),
              //     );
              //   },
              // )
            ],
          ),
          if (isHorizon)
            Text(
              product.name.length < 25
                  ? product.description
                  : '${product.name.substring(0, 13)}...',
              maxLines: 3,
            ),
        ],
      ),
    ],
  );
}

bool _hasDiscount(product) {
  return product.oldPrice != null &&
      product.oldPrice != product.price &&
      product.oldPrice != '0.00';
}

Widget _buildDiscountBadge() {
  return Center(
    child: Container(
      color: Colors.blue[900],
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Text(
        'discount',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    ),
  );
}

Widget _buildAddToCartButton(context) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    ),
  );
}

Widget _buildPriceTag(context, product) {
  return Positioned(
    top: 8,
    right: 8,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '${product.price}SP',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
