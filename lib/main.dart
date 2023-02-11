import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentcar/Provider/provider.dart';
import 'package:rentcar/Screen/Splach.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final isDark = sharedPreferences.getBool('isDark') ?? false;
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatefulWidget {
  final bool isDark;

  const MyApp({super.key, required this.isDark});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppProvider>(
      create: (context) {
        return AppProvider(widget.isDark);
      },
      child: Consumer<AppProvider>(builder: (context, provider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: provider.getTheme,
          home: Splash1(),
        );
      }),
    );
  }
}
