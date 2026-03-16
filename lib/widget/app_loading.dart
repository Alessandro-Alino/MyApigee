import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
