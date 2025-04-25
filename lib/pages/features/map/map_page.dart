import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 1.5,
        )),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Map Page', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.black,
          fontSize: 24,
          letterSpacing: 1.5,
        )),
      ),
    );
  }

}