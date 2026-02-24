import 'dart:io';
import 'package:SastaKhana/spleshscreen.dart';
import 'package:SastaKhana/utils/colornotifire.dart';
import 'package:SastaKhana/utils/constant.dart';
import 'package:SastaKhana/utils/material_you_model.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'Global/Config.dart';
import 'Global/Themes/app_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Config.appFlavor = Flavor.DEV;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ColorNotifire())],
      child: RestartWidget(
        child: FutureBuilder<Color>(
          future: getMaterialYouData(),
          builder: (_, snap) {
            return ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return GlobalLoaderOverlay(
                  overlayColor: Colors.black.withValues(alpha: 0.7),
                  overlayWidgetBuilder: (_) {
                    return Center(
                      child: SpinKitDancingSquare(
                        color: Color(0xff045e46),
                        size: 69,
                      ),
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      hideKeyboard(context);
                    },
                    child: SafeArea(
                      bottom: Platform.isAndroid ? true : false,
                      top: false,
                      child: GetMaterialApp(
                        builder: (context, child) {
                          child = ResponsiveBreakpoints.builder(
                            child: BouncingScrollWrapper.builder(
                              context,
                              child!,
                            ),
                            breakpoints: [
                              const Breakpoint(
                                start: 0,
                                end: 450,
                                name: MOBILE,
                              ),
                              const Breakpoint(
                                start: 451,
                                end: 1000,
                                name: TABLET,
                              ),
                              const Breakpoint(
                                start: 1001,
                                end: 1920,
                                name: DESKTOP,
                              ),
                              const Breakpoint(
                                start: 1921,
                                end: double.infinity,
                                name: '4K',
                              ),
                            ],
                          );
                          child = botToastBuilder(context, child);
                          return child;
                        },
                        initialRoute: '/',
                        debugShowCheckedModeBanner: false,
                        navigatorKey: navigatorKey,
                        home: Spleshscreen(),
                        theme: AppTheme.lightTheme(color: snap.data),
                        themeMode: ThemeMode.light,
                        scrollBehavior: SBehavior(),
                        title: APP_NAME,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({required this.child});

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
