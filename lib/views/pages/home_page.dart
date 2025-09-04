// import 'package:cached_network_image/cached_network_image.dart';
import 'package:alqasim_market/BloC/app_bloc.dart';
import 'package:alqasim_market/BloC/states/app_states.dart';
import 'package:alqasim_market/models/home_model.dart';
import 'package:alqasim_market/views/widgets/FadeInWidget.dart';
import 'package:alqasim_market/views/widgets/carousel_slider.dart';
import 'package:alqasim_market/views/widgets/category_item.dart';
import 'package:alqasim_market/views/widgets/circular_progress.dart';
import 'package:alqasim_market/views/widgets/fildSearchButton.dart';
import 'package:alqasim_market/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    // استدعاء الحدث هنا
    // هذه هي الطريقة الأفضل والأكثر شيوعًا
    BlocProvider.of<AppBloc>(context).getHomeData(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppBloc.get(context);

        if (state is ErorrHomeState) {
          return Center(child: Text('error in server'));
        }

        return Scaffold(
          body:
              cubit.homeModel != null
                  ? FadeInWidget(
                    child: SingleChildScrollView(
                      child: bodyHome(context, cubit),
                    ),
                  )
                  : Center(child: circularProgress(context)),
        );
      },
    );
  }

  Widget bodyHome(context, AppBloc cubit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // شريط البحث
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 40, right: 40),
          child: GestureDetector(
            child: fildSearchButton(context),
            onTap: () {},
          ),
        ),

        // التخفيضات
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            ' 😍 التخفيضات الحصرية',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'fox',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 255, // التحكم في الارتفاع حسب الحاجة
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.homeModel?.data?.discountedProducts?.length ?? 0,
              itemBuilder: (context, index) {
                var product = cubit.homeModel?.data?.discountedProducts?[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: SizedBox(
                    width: 170,
                    child: buildProductItem(context, product),
                  ),
                );
              },
            ),
          ),
        ),

        // البنرات
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildCarouselSlider(
            context: context,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            images:
                cubit.homeModel?.data?.banners
                    ?.map((i) => i.image)
                    .where((image) => image != null)
                    .cast<String>()
                    .toList() ??
                [],
            isBoxFitcover: false,
          ),
        ),

        // الفئات
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'fox',
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cubit.homeModel?.data?.categories?.length ?? 0,
            itemBuilder: (context, index) {
              var category = cubit.homeModel?.data?.categories?[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: buildCategory(category, 80, 80, context),
              );
            },
          ),
        ),

        // المنتجات الحديثة
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fox',
                ),
              ),
              TextButton(onPressed: () {}, child: Text('View More')),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
            itemCount: cubit.homeModel?.data?.latestProducts?.length ?? 0,
            itemBuilder: (context, index) {
              var product = cubit.homeModel?.data?.latestProducts?[index];
              return buildProductItem(context, product);
            },
          ),
        ),

        // الفئات مع المنتجات - في نهاية الشاشة
        buildCategoriesWithProducts(
          cubit.homeModel?.data?.categoriesWithProducts,
        ),
      ],
    );
  }

  Widget buildCategoriesWithProducts(
    List<CategoryWithProducts>? categoriesWithProducts,
  ) {
    if (categoriesWithProducts == null || categoriesWithProducts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'لا توجد فئات تحتوي على منتجات حالياً.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoriesWithProducts.length,
      itemBuilder: (context, index) {
        final category = categoriesWithProducts[index];

        // تحقق إضافي للتأكد من أن قائمة المنتجات ليست فارغة
        if (category.products == null || category.products!.isEmpty) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // اسم الفئة
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  category.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // المنتجات التابعة للفئة
              SizedBox(
                height: 255, // حسب حجم كارد المنتج
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: category.products!.length,
                  itemBuilder: (context, productIndex) {
                    final product = category.products![productIndex];
                    return buildProductItem(context, product);
                  },
                  separatorBuilder: (context, _) => const SizedBox(width: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
