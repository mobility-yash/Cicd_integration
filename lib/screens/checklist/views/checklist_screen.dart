import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controlers/checklist_controller.dart';

class ChecklistScreen extends StatelessWidget {
  final controller = Get.put(ChecklistController());

  ChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lambda Integration")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              }
              return SizedBox();
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.fetchData,
              child: Text("GET Data"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: controller.sendEvent,
              child: Text("POST Event"),
            ),

            SizedBox(height: 20),
            Obx(() => Text(
              controller.responseData.value,
              style: TextStyle(color: Colors.blue),
            )),
            Obx(() => Text(
              controller.success.value,
              style: TextStyle(color: Colors.green),
            )),
            Obx(() => Text(
              controller.error.value,
              style: TextStyle(color: Colors.red),
            )),
          ],
        ),
      ),
    );
  }
}