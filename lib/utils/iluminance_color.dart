import 'dart:ui';

extension IluminanceColor on Color {
  Color darkenColor(Color color, double darkness) {
    int red = (color.red * (1 - darkness)).round();
    int green = (color.green * (1 - darkness)).round();
    int blue = (color.blue * (1 - darkness)).round();
    return Color.fromARGB(color.alpha, red, green, blue);
  }

  Color brightenColor(Color color, double brightness) {
    int red = (color.red + (255 - color.red) * brightness).round();
    int green = (color.green + (255 - color.green) * brightness).round();
    int blue = (color.blue + (255 - color.blue) * brightness).round();
    return Color.fromARGB(color.alpha, red, green, blue);
  }
}
