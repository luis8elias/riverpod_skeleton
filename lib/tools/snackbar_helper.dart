import 'package:flutter/material.dart';

import '/tools/constants.dart';

class SnackbarHelper{

  static void show(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(kPadding),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadius)
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        content: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).primaryColorLight
            ),
          ),
        )
      )
    );
  }
}