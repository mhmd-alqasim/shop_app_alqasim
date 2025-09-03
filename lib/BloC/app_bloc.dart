import 'package:alqasim_market/BloC/states/app_states.dart';
import 'package:alqasim_market/models/home_model.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/utilites/endpoint/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(InitialAppState());
  static AppBloc get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

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
}
