import 'package:alqasim_market/BloC/states/search_states.dart';
import 'package:alqasim_market/models/search_model.dart';
import 'package:alqasim_market/network/remote/diohelper.dart';
import 'package:alqasim_market/utilites/endpoint/endpoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Cubit<SearchStates> {
  SearchBloc() : super(InitialSearchState());

  static SearchBloc get(context) => BlocProvider.of(context);

  SearchModel? searchmodel;
  void getresult(String text) {
    emit(LoadinSearchState());
    DioHelper.postData(url: search, data: {'searchTerm': text})
        .then((value) {
          searchmodel = SearchModel.fromJson(value.data);
          print('text ${text}');
          print(value);
          emit(SuccsessSearchState());
        })
        .catchError((onError) {
          emit(ErrorSearchState());
          print(onError);
        });
  }
}
