import 'package:changing_themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context,_) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeProvider.themeMode,
        theme: MyThemes.light,
        darkTheme: MyThemes.dark,
        home: const HomePage(),
      );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Themes"),
        actions: const [
          ThemeSwitch()
        ],
      ),
      body: Column(
        children: const [
          Text("Hello World "),
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(value: themeProvider.isDarkMode, onChanged: (value) {
      final provider = Provider.of<ThemeProvider>(context, listen: false);
      provider.toggleTheme(value);
    },);
  }
}

