import 'package:example/core/controllers/persistence.controller.dart';
import 'package:example/core/translations/data.dart';
import 'package:example/features/app/pages.dart';
import 'package:example/features/app/routes.dart';
import 'package:example/features/general/smart_refresher_components.widget.dart';
import 'package:example/features/general/unknown.screen.dart';
import 'package:example/features/main/main_screen.binding.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PersistenceController persistence = Get.find();

    // MATERIAL APP
    final _materialApp = GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // LOCALE
      translationsKeys: translationKeys,
      locale: Locale(persistence.localeCode.val),
      fallbackLocale: const Locale('en', 'US'),
      // NAVIGATION
      initialRoute: Routes.main,
      initialBinding: MainBinding(),
      getPages: AppPages.routes,
      defaultTransition: Transition.native,
      transitionDuration: 200.milliseconds,
      // THEMING
      theme: FlexColorScheme.light(scheme: FlexScheme.jungle).toTheme, // light
      darkTheme:
          FlexColorScheme.dark(scheme: FlexScheme.jungle).toTheme, // dark
      themeMode: ThemeMode.system,
      // FONT SCALE
      builder: (context, child) {
        final data = MediaQuery.of(context);
        final scaleFactor =
            data.textScaleFactor * persistence.fontScaleFactor.val;
        return MediaQuery(
          data: data.copyWith(textScaleFactor: scaleFactor),
          child: child!,
        );
      },
      // UNKNOWN ROUTE FALLBACK SCREEN
      unknownRoute: GetPage(
        name: Routes.unknown,
        page: () => const UnknownScreen(),
      ),
    );

    return RefreshConfiguration(
      headerBuilder: () => const SmartRefresherHeader(),
      footerBuilder: () => const SmartRefresherFooter(),
      headerTriggerDistance: 80.0,
      springDescription: const SpringDescription(
        stiffness: 170,
        damping: 16,
        mass: 1.9,
      ),
      maxOverScrollExtent: 100,
      maxUnderScrollExtent: 0,
      enableScrollWhenRefreshCompleted: true,
      enableLoadingWhenFailed: true,
      hideFooterWhenNotFull: true,
      enableBallisticLoad: true,
      child: _materialApp,
    );
  }
}
