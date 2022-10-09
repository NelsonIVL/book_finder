import 'package:book_finder/bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Pantallas/home_page.dart';

void main() => runApp(BlocProvider(
      create: (context) => BookBloc(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 84, 82, 82))),
      title: 'BookFinder',
      home: HomePage(),
    );
  }
}
