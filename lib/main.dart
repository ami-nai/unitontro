import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:unitontro/data/services/initialization_service.dart';
import 'package:unitontro/ui/core/themes/customtheme.dart';
import 'package:unitontro/ui/home_page/widgets/home_page.dart';
import 'package:get/get.dart';
import 'package:unitontro/ui/signup/widgets/signup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await InitializationService.initializeApp();

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system, // Use system theme mode
      home: SignupScreen(),
    );
  }
}
