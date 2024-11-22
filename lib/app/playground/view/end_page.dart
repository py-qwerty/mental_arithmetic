

import 'package:flutter/material.dart';

import '../../home/view/home_page.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  static const String route = '/end';

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text('End Page!'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // Custom icon
          onPressed: () {
            // Define custom back action
            Navigator.pushNamedAndRemoveUntil(context, HomePage.route,
                (Route<dynamic> route) => false); // This condition removes all previous routes
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations!'),
            Text('You have completed the game'),
          ],
        ),
      ),
    ));
  }
}
