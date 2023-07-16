import 'package:flutter/material.dart';

import '/tools/constants.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    Key? key,
    required this.onPressed,
    required this.text
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        minimumSize: const Size(4,4),
        backgroundColor: onPressed != null 
        ? Theme.of(context).primaryColor : Colors.grey.withOpacity(0.7),
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)
        )
      ),
      onPressed: onPressed, 
      child:SizedBox(
        width: double.maxFinite, 
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      )
    );
  }
}