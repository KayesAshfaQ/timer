import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timer/timer_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        var timerInfo = Provider.of<TimerInfo>(context, listen: false);
        timerInfo.updateRemainingTime();
        timerInfo.randomColor();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build HomeScreen');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              var timerInfo = Provider.of<TimerInfo>(context, listen: false);
              timerInfo.resetRemainingTime();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TimerInfo>(
              builder: (context, value, child) => Icon(
                Icons.watch_later_sharp,
                size: 120,
                color: value.color,
              ),
            ),
            const SizedBox(height: 16),
            Consumer<TimerInfo>(
              builder: (context, value, child) => Text(
                value.remainingTime.toString(),
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
