import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p_project/enums/user.dart';
import 'package:p_project/router/router.dart';
import 'package:p_project/router/router_config.dart';
import 'package:p_project/store/app_store.dart';
import 'package:p_project/store/model/user_model.dart';
import 'package:p_project/strings/localization/app_localization_container.dart';
import 'package:p_project/strings/localization/localizations_utils.dart';
import 'package:p_project/ui/splash/splash_page.dart';
import 'package:p_project/utils/hive_utils.dart';
import 'package:p_utils/p_utils.dart';
import 'package:p_widget/p_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:screen_adaptation/screen_utils.dart';
import 'common/http/http.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'strings/localization/my_localizations_delegate.dart';

void main() {
  // FirebaseUtils.init();
  // runZoned(() {
  //   runApp(AppLocalizationContainer(
  //     child: MyApp(),
  //   ));
  // }, onError: Crashlytics.instance.recordError);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  WidgetsFlutterBinding.ensureInitialized();
  HiveUtils.init();

  final a = UserRoleExtension.fromInt(1);

  runApp(AppLocalizationContainer(
    child: MyApp(),
  ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel userModel = UserModel();

  @override
  void initState() {
    SPUtils.getInstance();
    // AnalyticsUtils.init();

    // FPSUtils().start();
    GlobalLoading.navigatorKey = RouterUtils.navigatorKey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Logger.d(msg: 'Main build');
    var locale = AppLocalizationContainer.of(context).locale;

    return AppStore.init(
      userModel: userModel,
      context: context,
      child: MaterialApp(
        navigatorKey: RouterUtils.navigatorKey,
        title: 'P',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: [
          RefreshLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          MyLocalizationsDelegate.delegate,
        ],
        supportedLocales: LocalizationsUtils.getSupportLocale(),
        locale: Locale(locale),
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          LocalizationsUtils.getAppLocale().then((value) {
            // Logger.d(msg: "LocalizationsUtils $value");
            Http.instance.changeHeader(
                'Lang', converToHeaderLocale(LocalizationsUtils.currentLocale));
          });
          return locale;
        },
        home: Builder(
          builder: (context) {
            MScreenUtils.init(context);
            AppStore.widgetCtx = context;
            return SplashPage();
          },
        ),
        routes: route,
        // navigatorObservers: [
        //   FirebaseUtils.observer,
        //   AppAnalysis(),
        // ],
      ),
    );
  }
}
