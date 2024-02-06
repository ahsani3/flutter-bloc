import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_bloc/bloc.dart';
import 'package:project_bloc/home_page.dart';
// import 'package:project_bloc/provider.dart';
// import 'package:project_bloc/statefull.dart';
// import 'package:provider/provider.dart';
// import 'cubit/counter_cubit.dart';

void main() {
  runApp(
    // ChangeNotifierProvider(
    //   create: (context) => Counter(),
    //   child: MyApp(),
    // ),

    // BlocProvider(
    //   create: (context) => CounterCubit(),
    //   child: MyApp(),
    // ),

    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // MyBloc(),
          // MyProvider(),
          // MyStatefulWidget(),
          BlocProvider(
        create: (context) => CounterCubit(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
