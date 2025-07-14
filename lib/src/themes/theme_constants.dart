
import '../utils/screen_export.dart';

TextTheme lightextTheme = TextTheme(
  displaySmall: Staticsstyle.displaySmall,
  labelMedium: Staticsstyle.labelMedium,
  labelSmall: Staticsstyle.labelSmall,
  bodySmall: Staticsstyle.bodySmall,
  bodyMedium: Staticsstyle.bodyMedium,
  labelLarge: Staticsstyle.labelLarge,
  bodyLarge: Staticsstyle.bodyLarge,
);
TextTheme darkTextTheme = TextTheme(
  displaySmall: StaticsDarkstyle.displaySmall,
  labelMedium: StaticsDarkstyle.labelMedium,
  labelSmall: StaticsDarkstyle.labelSmall,
  bodySmall: StaticsDarkstyle.bodySmall,
  bodyMedium: StaticsDarkstyle.bodyMedium,
  labelLarge: StaticsDarkstyle.labelLarge,
  bodyLarge: StaticsDarkstyle.bodyLarge,
);

ThemeData lightTheme = ThemeData(
  textTheme: lightextTheme,
  scaffoldBackgroundColor: StaticsLightColor.scaffoldBackgroundColor,

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: StaticsLightColor.textColor,
    onPrimaryFixed: StaticsLightColor.textColor2,
    onPrimary: StaticsLightColor.containerColor,
    secondary: StaticsLightColor.mainColor,
    onSecondary: StaticsLightColor.scaffoldBackgroundColor,

    error: StaticsLightColor.aler,
    onError: StaticsLightColor.errorColor,
    surface: StaticsLightColor.iconColor,
    onSurface: StaticsLightColor.borderColor,
    surfaceContainer: StaticsLightColor.greenColor,
    surfaceContainerLow: StaticsLightColor.cardBorderColor,
    surfaceContainerHighest: StaticsLightColor.categoriesColor
  ),

  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: StaticsLightColor.cardBorderColor),
        borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: StaticsLightColor.borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Status bar background color
      statusBarIconBrightness:
          Brightness.light, // White icons for dark status bar
      statusBarBrightness: Brightness.dark, // For iOS
    ),
    iconTheme: IconThemeData(color: StaticsLightColor.textColor),
    titleTextStyle: TextStyle(color: StaticsLightColor.textColor),
  ),
  iconTheme: IconThemeData(color: StaticsLightColor.textColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: lightextTheme.labelSmall!.copyWith(fontSize: 10),
    unselectedLabelStyle: lightextTheme.labelSmall!.copyWith(fontSize: 10),
    backgroundColor: StaticsLightColor.scaffoldBackgroundColor,
    selectedItemColor: StaticsLightColor.mainColor,
    unselectedItemColor: StaticsLightColor.iconColor,
  ),
);

ThemeData darkTheme =  ThemeData(
  textTheme: darkTextTheme,
  scaffoldBackgroundColor: StaticsDarkColor.scaffoldBackgroundColor,

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: StaticsDarkColor.textColor,
    onPrimaryFixed: StaticsDarkColor.textColor2,
    onPrimary: StaticsDarkColor.containerColor,
    secondary: StaticsDarkColor.mainColor,
    onSecondary: StaticsDarkColor.scaffoldBackgroundColor,

    error: StaticsDarkColor.aler,
    onError: StaticsDarkColor.errorColor,
    surface: StaticsDarkColor.iconColor,
    onSurface: StaticsDarkColor.borderColor,
    surfaceContainer: StaticsDarkColor.greenColor,
    surfaceContainerLow: StaticsDarkColor.cardBorderColor,
    surfaceContainerHighest: StaticsDarkColor.categoriesColor
  ),

  inputDecorationTheme: InputDecorationTheme(
     focusedBorder: OutlineInputBorder(
       borderSide: BorderSide(color: StaticsLightColor.cardBorderColor),
        borderRadius: BorderRadius.circular(15),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: StaticsDarkColor.borderColor),
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black, // Status bar background color
      statusBarIconBrightness:
          Brightness.light, // White icons for dark status bar
      statusBarBrightness: Brightness.dark, // For iOS
    ),
    iconTheme: IconThemeData(color: StaticsDarkColor.textColor),
    titleTextStyle: TextStyle(color: StaticsDarkColor.textColor),
  ),
  iconTheme: IconThemeData(color: StaticsDarkColor.textColor),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedLabelStyle: lightextTheme.labelSmall!.copyWith(fontSize: 10),
    unselectedLabelStyle: lightextTheme.labelSmall!.copyWith(fontSize: 10),
    backgroundColor: StaticsDarkColor.scaffoldBackgroundColor,
    selectedItemColor: StaticsDarkColor.mainColor,
    unselectedItemColor: StaticsDarkColor.iconColor,
  ),
);
