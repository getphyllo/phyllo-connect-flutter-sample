import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/constants/app_colors.dart';
import 'package:flutter_sample_app/firebase_options.dart';
import 'package:flutter_sample_app/phyllo_provider.dart';
import 'package:flutter_sample_app/views/home.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_segment/flutter_segment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // String writeKey;
  // if(Platform.isAndroid){
  //   writeKey = "ANDROID_WRITE_KEY";
  // } else{ //iOS
  //     writeKey = "BlyL5SQZviylLCl6c5ceDLMFpvdt1TEc";
  // }

  // Segment.config(
  //   options: SegmentConfig(
  //     writeKey: writeKey,
  //     trackApplicationLifecycleEvents: false,
  //     amplitudeIntegrationEnabled: false,
  //     debug: false,
  //   ),
  // );

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace, fatal: true);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PhylloProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Phyllo Connect Example',
        theme: _getThemeData(),
        home: const MyHomePage(),
      ),
    );
  }

  ThemeData _getThemeData() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      splashColor: Colors.white.withOpacity(0.2),
      highlightColor: Colors.white.withOpacity(0.2),
      unselectedWidgetColor: Colors.grey.shade400,
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all(Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(width: 1, color: Colors.grey.shade400),
        ),
      ),
      colorScheme:
          ColorScheme.fromSwatch(primarySwatch: generateMaterialColor())
              .copyWith(secondary: AppColors.primaryColor),
    );
  }
}
