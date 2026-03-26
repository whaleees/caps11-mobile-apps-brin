import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
	const AppTheme._();

	static ThemeData get light {
		final colorScheme = AppColors.lightColorScheme;
		final textTheme = GoogleFonts.interTextTheme(AppTypography.textTheme());

		return ThemeData(
			useMaterial3: true,
			colorScheme: colorScheme,
			fontFamily: GoogleFonts.inter().fontFamily,
			scaffoldBackgroundColor: colorScheme.surface,
			textTheme: textTheme,
			appBarTheme: AppBarTheme(
				centerTitle: false,
				backgroundColor: colorScheme.surface,
				foregroundColor: colorScheme.onSurface,
				surfaceTintColor: Colors.transparent,
				elevation: 0,
			),
			elevatedButtonTheme: ElevatedButtonThemeData(
				style: ElevatedButton.styleFrom(
					backgroundColor: colorScheme.primary,
					foregroundColor: colorScheme.onPrimary,
					minimumSize: const Size.fromHeight(48),
					shape: RoundedRectangleBorder(
						borderRadius: BorderRadius.circular(12),
					),
				),
			),
			inputDecorationTheme: InputDecorationTheme(
				filled: true,
				fillColor: AppColors.secondary50,
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(12),
					borderSide: BorderSide(color: AppColors.secondary200),
				),
				enabledBorder: OutlineInputBorder(
					borderRadius: BorderRadius.circular(12),
					borderSide: BorderSide(color: AppColors.secondary200),
				),
				focusedBorder: OutlineInputBorder(
					borderRadius: BorderRadius.circular(12),
					borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
				),
			),
		);
	}
}
