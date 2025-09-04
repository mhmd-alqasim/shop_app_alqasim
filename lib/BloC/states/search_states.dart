abstract class SearchStates {}

class InitialSearchState extends SearchStates {}

class LoadinSearchState extends SearchStates {}

class SuccsessSearchState extends SearchStates {
  // Optional: You could pass the results model directly with the success state
  // final SearchModel searchResult;
  // SuccsessSearchState(this.searchResult);
}

class ErrorSearchState extends SearchStates {
  final String? errorMessage; // Optionally include an error message

  ErrorSearchState([this.errorMessage]); // Make message optional
}
