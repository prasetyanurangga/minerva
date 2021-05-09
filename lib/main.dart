import 'package:flutter/material.dart';
import 'package:minerva/pages/main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minerva/bloc/word/word_bloc.dart';
import 'package:minerva/provider/api_provider.dart';
import 'package:minerva/repository/word_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WordRepository>(
          create: (context) => WordRepository(),
          lazy: true,
        ),
        RepositoryProvider<ApiProvider>(
          create: (context) => ApiProvider(),
          lazy: true,
        ),
      ],
      child: MultiBlocProvider  (
        providers: [
          BlocProvider<WordBloc>(
            create: (context)  => WordBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: Color(0xFFFFFFFF),
            primaryColor:    Color(0xFF302C98)
          ),
          home: MainPage(),
        ),
      ),
    );
  }
}
