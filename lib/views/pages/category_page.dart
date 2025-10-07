import 'package:alqasim_market/BloC/app_bloc.dart';
import 'package:alqasim_market/BloC/states/app_states.dart';
import 'package:alqasim_market/views/widgets/category_item.dart';
import 'package:alqasim_market/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 1. تصحيح الاسم
// في ملف CategoriesPage.dart

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().getCategoriesData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state is ErrorCategoriesState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to load categories.')),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<AppBloc>();

        if (state is LoadingCategoriesState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorCategoriesState) {
          return const Center(child: Text('حدث خطأ في تحميل التصنيفات.'));
        }

        // الآن نعرض البيانات فقط في الحالة الأخيرة
        final categoriesData = cubit.categoriesModel?.data;
        if (categoriesData != null && categoriesData.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categoriesData.length,
              itemBuilder: (context, index) {
                var category = categoriesData[index];
                return buildCategory(category, 80, 80, context);
              },
            ),
          );
        }

        // في حالة أن لا توجد بيانات متاحة
        return const Center(child: Text('لا توجد بيانات متاحة.'));
      },
    );
  }
}
// في ملف DetailCategoriesScreen.dart

class DetailCategoriesScreen extends StatefulWidget {
  const DetailCategoriesScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailCategoriesScreen> createState() => _DetailCategoriesScreenState();
}

class _DetailCategoriesScreenState extends State<DetailCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().getCategoryDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme.primary),
        title: Text("Products", style: TextStyle(color: colorScheme.primary)),
        backgroundColor: colorScheme.background,
      ),
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state is ErrorCategoryDetailsState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to load product details.')),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AppBloc>();

          if (state is LoadingCategoryDetailsState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ErrorCategoryDetailsState) {
            return const Center(child: Text('حدث خطأ في تحميل تفاصيل المنتج.'));
          }

          final productsList = cubit.categoryDetailsModel?.data?.products;
          if (productsList != null && productsList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: productsList.length,
                itemBuilder: (context, index) {
                  final product = productsList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: buildProductItemHorizontal(context, product),
                  );
                },
              ),
            );
          }

          return const Center(child: Text('لا توجد منتجات في هذا التصنيف.'));
        },
      ),
    );
  }
}
