import 'package:alqasim_market/BloC/search_bloc.dart';
import 'package:alqasim_market/BloC/states/search_states.dart';
import 'package:alqasim_market/views/widgets/product_item.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocProvider(
      create: (context) => SearchBloc(),
      child: BlocConsumer<SearchBloc, SearchStates>(
        listener: (context, state) {
          if (state is ErrorSearchState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage ?? 'An error occurred during search.',
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = SearchBloc.get(context);

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            searchController.clear();
                            Navigator.pop(context);
                          },
                          icon: const Icon(EvaIcons.arrowBack),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                // color: defultcolor
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 0,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: TextFormField(
                                      controller: searchController,
                                      // cursorColor: defultcolor,
                                      textInputAction: TextInputAction.search,
                                      onChanged: (value) {
                                        if (value.trim().length > 2) {
                                          Future.delayed(
                                            const Duration(milliseconds: 500),
                                            () {
                                              cubit.getresult(value);
                                            },
                                          );
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        hintText: 'Search for products...',
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          vertical: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state is LoadinSearchState)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: LinearProgressIndicator(
                          // color: defultcolor,
                          // backgroundColor: defultcolor.withOpacity(0.2),
                        ),
                      ),
                    if (state is SuccsessSearchState)
                      Expanded(
                        child: ListView.builder(
                          itemCount: cubit.searchmodel!.data!.length,
                          itemBuilder: (context, index) {
                            final product = cubit.searchmodel!.data![index];
                            return SizedBox(
                              width: 170,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: buildProductItemHorizontal(
                                  context,
                                  product,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
