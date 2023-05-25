import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final keyword = ''.obs;
  final pair = <String, dynamic>{}.obs;
  final currentIndex = 0.obs;
  List<Widget> children = [];

  @override
  void onInit() {

    children = [
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget get currentPage => children[currentIndex.value];

  onSelectedItem(int index) async {
    currentIndex.value = index;
  }
}
