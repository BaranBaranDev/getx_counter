import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  final _controller = Get.put(_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => _controller._add() // bastıkça controller sınıfında ki fonksiyon baslayacak
          ),
      body: Center(
        child: Obx(() => Text(
            "${_controller._currentCounter.value}")), // değişimi görmek için obx ile sardık
      ),
    );
  }
}

// flutter pub add get
class _Controller extends GetxController {
  final RxInt _currentCounter = 0.obs; // izlemeye aldık

  int _add() {
    _currentCounter.value = _currentCounter.value + 1;
    return _currentCounter.value;
  }
}
