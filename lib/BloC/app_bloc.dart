import 'package:alqasim_market/BloC/states/app_states.dart';
import 'package:alqasim_market/models/categories_model.dart';
import 'package:alqasim_market/models/home_model.dart';
import 'package:alqasim_market/models/product_model.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/const/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialAppState());
  static AppBloc get(context) => BlocProvider.of(context);

  HomeModel? homeModel;
  ProductModel? productmodel;
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexStates()); // تحديث الفهرس
  }

  void getHomeData(context) {
    emit(LoadingHomeState());

    DioHelper.getData(url: HOME)
        .then((value) {
          if (value.data is Map<String, dynamic>) {
            homeModel = HomeModel.fromJson(value.data);
            if (homeModel!.status == true) {
              emit(SccessHomeState());
            } else {
              emit(ErorrHomeState());
            }
          } else {
            emit(ErorrHomeState());
          }
        })
        .catchError((error) {
          emit(ErorrHomeState());
        });
  }

  productdetail(int id) {
    emit(LoadingProductState());
    DioHelper.postData(url: PRODUCT, data: {'id': id})
        .then((value) {
          productmodel = ProductModel.fromJson(value.data);
          if (productmodel!.status!) {
            emit(SccessProductState());
          } else {
            print(productmodel!.status);
            emit(ErorrProductState(productmodel!.status));
          }
        })
        .catchError((e) {
          print(e);
          emit(ErorrProductState(e));
        });
  }

  CategoriesModel? categoriesModel;
  CategorieDetailsModel? categoryDetailsModel;

  void getCategoriesData() {
    emit(LoadingCategoriesState());

    DioHelper.getData(url: CATEGORY)
        .then((value) {
          categoriesModel = CategoriesModel.fromJson(value.data);

          if (categoriesModel!.status == true) {
            emit(SuccessCategoriesState());
          } else {
            emit(ErrorCategoriesState());
          }
        })
        .catchError((error) {
          emit(ErrorCategoriesState());
        });
  }

  void getCategoryDetails(int id) {
    emit(LoadingCategoryDetailsState());

    // أفضل ممارسة هي استخدام GET مع ID في الرابط
    DioHelper.postData(url: CATEGORYDETAILS, data: {'id': id})
        .then((value) {
          categoryDetailsModel = CategorieDetailsModel.fromJson(value.data);

          if (categoryDetailsModel!.status == true) {
            emit(SuccessCategoryDetailsState());
          }
        })
        .catchError((error) {
          // إرسال رسالة خطأ واضحة
          print("Error: ${error.toString()}");
          emit(
            ErrorCategoryDetailsState(
              // message: error.toString()
            ),
          );
        });
  }
}
