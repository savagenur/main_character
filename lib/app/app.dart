import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main_character/app/colors/app_colors.dart';
import 'package:main_character/app/di/injection_container.dart';
import 'package:main_character/app/dimension/design_dimension.dart';
import 'package:main_character/app/router/app_router.dart';
import 'package:main_character/app/theme/app_text_theme/app_text_theme.dart';
import 'package:main_character/core/extension/build_context_extension.dart';
import 'package:main_character/l10n/l10n.dart';

class MainCharacterApp extends StatelessWidget {
  const MainCharacterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = sl<AppRouter>();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(context),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: const Locale("ru"),
    );
  }

  ThemeData theme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColorsLight.primaryGreen,
      ),
      useMaterial3: true,
      textTheme: GoogleFonts.rubikTextTheme(AppTextTheme.lightTextTheme),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: DDimens.biggerPadding,
          vertical: DDimens.mediumPadding,
        ),
        tileColor: context.colors.gray80,
        shape: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          borderSide: BorderSide.none,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: appColorsLight.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: DDimens.biggerPadding,
          horizontal: DDimens.largePadding,
        ),
        suffixStyle: TextStyle(color: appColorsLight.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          borderSide: BorderSide(
            width: 1.5,
            color: appColorsLight.primaryGreen,
          ),
          gapPadding: DDimens.smallPadding,
        ),
        border: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          gapPadding: DDimens.smallPadding,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: DDimens.bigRadius.radius,
          borderSide: BorderSide(
            width: 1,
            color: appColorsLight.gray20,
          ),
          gapPadding: DDimens.smallPadding,
        ),
      ),
    );
  }
}
