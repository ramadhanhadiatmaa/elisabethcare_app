import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_dokter_controller.dart';

class DetailDokterView extends GetView<DetailDokterController> {
  const DetailDokterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailDokterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailDokterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
