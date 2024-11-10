



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayGroundPage  extends StatelessWidget {
  const PlayGroundPage ({super.key});

  static const String route = '/playground';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playground'),
      ),
      body: const Center(
        child: Text('Playground'),
      ),
    );
  }
}
