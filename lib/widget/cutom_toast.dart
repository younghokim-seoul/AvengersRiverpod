import 'package:flutter/material.dart';

import 'package:riverpod_sample/resources/app_styles.dart';
import 'package:riverpod_sample/resources/resources.dart';

class CustomToast extends StatelessWidget {
  const CustomToast(this.toastMessage, {Key? key}) : super(key: key);

  final String toastMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 52,
      decoration: AppStyles.containerDecoration(
        radius: 20.0,
        color: AppColors.gray6.withOpacity(0.8),
      ),
      child: Center(
        child: Text(
          toastMessage,
          style: AppStyles.regular12,
        ),
      ),
    );
  }
}
