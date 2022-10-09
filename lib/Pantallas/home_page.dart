import 'package:book_finder/Widget/Shimmer_widget.dart';
import 'package:book_finder/Widget/book_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/book_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String toSearch = '';
    return Scaffold(
      appBar: AppBar(title: Text("Librería free to play")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  toSearch = value;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "Ingresa título",
                    suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<BookBloc>(context)
                              .add(BookSearchEvent(titleSearch: toSearch));
                        },
                        icon: Icon(Icons.search))),
              ),
              SizedBox(
                height: 20,
              ),
              stateWidget(),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<BookBloc, BookState> stateWidget() {
    return BlocConsumer<BookBloc, BookState>(
      listener: (context, state) {
        if (state is BookNotFoundState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("${state.errorMsg}")));
        }
      },
      builder: (context, state) {
        if (state is BookSearchState) {
          return shimmerDisplay(context);
        } else if (state is BookFoundState) {
          print(context.watch<BookBloc>().books[
              0]); //Me permite acceder a los elementos de la lista de libros
          return resultsFromSearch(context);
        } else {
          return Column(
            children: [
              SizedBox(
                height: 260,
              ),
              Text("Ingrese palabra para buscar libro")
            ],
          );
        }
      },
    );
  }

  Container shimmerDisplay(BuildContext context) {
    return Container(
      height: 575,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 30,
            mainAxisSpacing: 35),
        itemCount: context.read<BookBloc>().books.length,
        itemBuilder: (BuildContext context, int index) {
          return ShimmerWidget();
        },
      ),
    );
  }

  Container resultsFromSearch(BuildContext context) {
    return Container(
      height: 575,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 1,
            crossAxisSpacing: 30,
            mainAxisSpacing: 35),
        itemCount: context.watch<BookBloc>().books.length,
        itemBuilder: (BuildContext context, int index) {
          return BookResults(
              books: context.watch<BookBloc>().books[index], indice: index);
        },
      ),
    );
  }
}
