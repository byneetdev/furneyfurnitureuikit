// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'src/helpers/constants.dart';
import 'src/helpers/routes.dart';
import 'src/helpers/themes.dart';
import 'src/providers/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, snapshot) {
          return GetMaterialApp(
            title: 'Furney',
            theme: themeLight(context),
            darkTheme: themeDark(context),
            themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            initialRoute: Routes.home,
            getPages: allRoutes,
          );
        },
      ),
    );
  }
}
