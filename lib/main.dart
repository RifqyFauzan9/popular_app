import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:most_popular_applications/provider/liked_app_provider.dart';
import 'package:provider/provider.dart';
import 'ui/home_page.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => LikedAppProvider(),
        child: DevicePreview(
          enabled: true,
          builder: (context) => const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Most Popular App',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
