import 'package:flutter/widgets.dart';

class VariableSizing {
  BuildContext context;

  VariableSizing(this.context);

  double get mainScreenSize =>
      MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.height;

  double get screenWidth => MediaQuery.of(context).size.width;

  double get screenHeight => MediaQuery.of(context).size.height;

  double get timerText => mainScreenSize / 8;

  double get timerRadius => mainScreenSize / 2 - 32;

  double get bigText => mainScreenSize / 19;

  double get buttonText => mainScreenSize / 32;
}
