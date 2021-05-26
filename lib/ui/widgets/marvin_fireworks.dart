import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:marvin_kitchen/config/constants/ui/theme_constants.dart';

class MarvinFireWorks extends StatelessWidget {
  MarvinFireWorks({required this.theme, this.width, this.height});

  MarvinTheme theme;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(theme.fireworkPath, width: width, height: height);
  }


}