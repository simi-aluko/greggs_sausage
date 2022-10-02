import 'package:flutter/material.dart';
import 'package:greggs_susage/core/dimens.dart';

class WidgetMessageDisplay extends StatelessWidget {
  final String message;

  const WidgetMessageDisplay({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            message,
            style: TextStyle(fontSize: dimenMText),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
