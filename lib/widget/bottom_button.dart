import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.isEnable,
    required this.buttonTitle,
    required this.onPressed,
  }) : super(key: key);

  final bool isEnable;
  final String buttonTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnable
            ? () {
          onPressed();
        }
            : null,
        child: Text(buttonTitle),
      ),
    );
  }
}
