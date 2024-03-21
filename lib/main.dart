import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isp_wallet/style.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'routers/routes.dart';

double width = 0;
double height = 0;

Future<void> main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext buildContext) {
    width = MediaQuery.of(buildContext).size.width;
    height = MediaQuery.of(buildContext).size.height;
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp.router(
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale('en'),
          themeMode: ThemeMode.light,
          theme: ThemeData(
            scaffoldBackgroundColor: BC.black,
            bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
          ),
          supportedLocales: S.delegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        ),
      );

  }
}
