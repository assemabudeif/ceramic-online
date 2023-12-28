
extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

// extension TextThemeInContext on BuildContext {
//   TextTheme get textTheme => Theme.of(this).textTheme;
// }

// extension ThemeInContext on BuildContext {
//   ThemeData get themeOf => Theme.of(this);
// }