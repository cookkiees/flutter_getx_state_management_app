import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;

  void onIncrement() {
    counter.value += 1;
  }

  void onDecrement() {
    counter.value -= 1;
  }
}
