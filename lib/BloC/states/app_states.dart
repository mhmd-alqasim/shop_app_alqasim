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
