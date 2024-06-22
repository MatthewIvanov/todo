import 'package:flutter/material.dart';
import 'package:todo_/core/data.dart';
import 'features/main/main_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DataModel(
      notifier: DataNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 26, 148, 248),
            appBarTheme: const AppBarTheme(
                color: Color.fromARGB(255, 255, 255, 255),
                titleTextStyle: TextStyle(color: Colors.black),
                foregroundColor: Colors.black),
            textTheme: const TextTheme(
                labelLarge: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600))),
        home: const MainScreen(),
      ),
    );
  }
}
