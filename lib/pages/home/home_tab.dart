import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'Home Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
