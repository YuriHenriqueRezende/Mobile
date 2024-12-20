import 'package:app_base/themes/theme.dart';
import 'package:flutter/material.dart';

class AltButton extends StatelessWidget {
  final Color? colorBG;
  final Color? colorIcon;
  final Function()? onTap;
  final IconData icon;
  const AltButton(
      {super.key,
      required this.onTap,
      required this.icon,
      required this.colorBG,
      required this.colorIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppTheme.cor6,
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: colorBG,
          ),
          child: Center(
              child: Icon(
            icon,
            size: 60,
            color: colorIcon,
          )),
        ),
      ),
    );
  }
}
