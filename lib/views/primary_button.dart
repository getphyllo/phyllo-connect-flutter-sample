import 'package:flutter/material.dart';
import 'package:flutter_sample_app/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final double height;
  final double? width;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return MaterialButton(
      child: Text(
        label,
        style: const TextStyle(fontSize: 15, letterSpacing: 0.5),
      ),
      height: height,
      minWidth: width ?? mq.size.width,
      elevation: 0,
      highlightElevation: 0,
      textColor: Colors.white,
      color: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
    );
  }
}

class DialogButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onPressed;

  const DialogButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.color = Colors.white,
    this.borderColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: color,
        minimumSize: const Size(100, 34),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: borderColor),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
