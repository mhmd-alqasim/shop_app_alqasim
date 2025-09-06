import 'package:alqasim_market/BloC/app_bloc.dart';
import 'package:alqasim_market/BloC/states/app_states.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/views/widgets/FadeInWidget.dart';
import 'package:alqasim_market/views/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id});

  final int id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    // استدعاء التابع productdetail() على النسخة الموجودة من AppBloc
    context.read<AppBloc>().productdetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<AppBloc>();

        if (state is LoadingProductState ||
            cubit.productmodel == null ||
            cubit.productmodel!.data == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(
            // iconTheme: IconThemeData(color: colorScheme.secondary),
            title: Text(cubit.productmodel!.data!.name ?? 'تفاصيل المنتج'),
            backgroundColor: colorScheme.secondary,
          ),
          body: FadeInWidget(child: body(context, cubit)),
          bottomSheet: _buildBottomSheet(context, cubit, colorScheme),
        );
      },
    );
  }

  Widget body(context, product) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 230), // لحل مشكلة الورقة السفلية
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return Column(
                children: [
                  buildCarouselSlider(
                    context: context,
                    onPageChanged: (index, reason) {
                      product.changeIndex(index);
                    },
                    images:
                        product.productmodel!.data?.detailImages
                            ?.map((i) => DioHelper.baseUrl + i)
                            .toList()
                            .cast<String>() ??
                        [],
                    isBoxFitcover: true,
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: AppBloc.get(context).currentIndex,
                      count:
                          product.productmodel!.data?.detailImages.length ?? 0,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        activeDotColor: colorScheme.secondary,
                        dotColor: colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 10),
          const Divider(),
          _buildItemDetails(product),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'You may also like',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                final colors = [
                  Colors.red,
                  Colors.blue,
                  Colors.green,
                  Colors.orange,
                  Colors.purple,
                  Colors.teal,
                ];

                return Container(
                  width: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'منتج ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildItemDetails(product) {
    List<String> descriptionLines = product.productmodel.data.description.split(
      "\r\n",
    );

    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            '${product.productmodel!.data!.name}',
            style: const TextStyle(
              fontFamily: 'fox',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Description',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          ...descriptionLines.map((line) {
            bool isHeading = line == line.toUpperCase();
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isHeading)
                  const Icon(Icons.circle, size: 8, color: Colors.black),
                if (isHeading) const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    line,
                    style: TextStyle(
                      fontSize: isHeading ? 16 : 14,
                      fontWeight:
                          isHeading ? FontWeight.bold : FontWeight.normal,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context, product, color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: color.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${product.productmodel!.data!.price} \ٍSP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  if (product.productmodel!.data!.oldPrice != null &&
                      product.productmodel!.data!.oldPrice !=
                          product.productmodel!.data!.price &&
                      product.productmodel!.data!.oldPrice != '0.00')
                    Text(
                      '${product.productmodel!.data!.oldPrice} \SP',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      '2',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // إضافة للمفضلة
                },
                icon: const Icon(Icons.favorite_border),
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    // إضافة إلى السلة
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
