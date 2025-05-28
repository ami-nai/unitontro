import 'package:flutter/material.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routine', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 1.5,
        )),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Be patient', style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          
        )),
      ),
    );
  }
}