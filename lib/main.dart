import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/config/config.dart';
import 'package:store/features/categories/presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Store exito',
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
        home: CategoriesScreen(),
      ),
    );
  }
}
