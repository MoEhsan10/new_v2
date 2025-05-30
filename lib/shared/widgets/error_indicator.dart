import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, this.message});
  final String? message;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(message??''),
    );
  }
}
