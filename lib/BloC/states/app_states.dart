abstract class AppState {}

class InitialAppState extends AppState {}

class LoadingHomeState extends AppState {}

class SccessHomeState extends AppState {}

class ErorrHomeState extends AppState {}

class LoadingProductState extends AppState {}

class SccessProductState extends AppState {}

class ErorrProductState extends AppState {
  ErorrProductState(e);
}

class ChangeIndexStates extends AppState {}

////////////
class LoadingCategoriesState extends AppState {}

class SuccessCategoriesState extends AppState {}

class ErrorCategoriesState extends AppState {}

class LoadingCategoryDetailsState extends AppState {}

class SuccessCategoryDetailsState extends AppState {}

class ErrorCategoryDetailsState extends AppState {}
