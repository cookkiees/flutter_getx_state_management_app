import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterScreen extends GetView<CounterController> {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'C O U N T E R',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: _buildCounter(),
    );
  }

  Widget _buildCounter() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Value:',
            style: TextStyle(fontSize: 20),
          ),
          Obx(
            () => Text(
              controller.counter.value.toString(),
              style: const TextStyle(fontSize: 40),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => controller.onIncrement(),
                child: const Icon(Icons.add, color: Colors.white),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => controller.onDecrement(),
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
