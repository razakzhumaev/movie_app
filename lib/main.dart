import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_wars_app/firebase_options.dart';
import 'package:star_wars_app/generated/l10n.dart';
import 'package:star_wars_app/internal/components/routes/auto_route.dart';
import 'package:star_wars_app/internal/dependencies/get_it.dart';
import 'package:star_wars_app/internal/helpers/localization/bloc/global_localization_bloc.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalLocalizationBloc globalBloc = GlobalLocalizationBloc();
  String? locale;
  final _appRouter = AppRouter();

  @override
  void initState() {
    localeHelper();
    super.initState();
  }

  localeHelper() async {
    String locale = await getCurrentLocale();
    globalBloc.add(ChangeLocaleEvent(locale: locale));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalLocalizationBloc(),
      child: BlocConsumer<GlobalLocalizationBloc, GlobalLocalizationState>(
        listener: (context, state) {
          if (state is GlobalLocalizationLoadedState) {
            locale = state.locale;
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp.router(
              locale: Locale.fromSubtags(languageCode: locale ?? 'ru'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              routerConfig: _appRouter.config(),
            ),
          );
        },
      ),
    );
  }
}
