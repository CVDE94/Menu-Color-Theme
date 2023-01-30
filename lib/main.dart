import 'package:flutter/material.dart';
import 'package:flutter_theme/src/pages/launcher_page.dart';
import 'package:flutter_theme/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => ThemeChanger(3),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const LauncherPage(),
    );
  }
}
