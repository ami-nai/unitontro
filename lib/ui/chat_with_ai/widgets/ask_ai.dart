import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class AskAiController extends GetxController {
  var prompt = "".obs; // Observable for the prompt
  var response = "...".obs; // Observable for the AI response
  var isLoading = false.obs; // Observable for loading state

  Future<void> sendPrompt() async {
    if (prompt.value.isEmpty) {
      Get.snackbar('Error', 'Please enter a prompt');
      return;
    }

    try {
      isLoading.value = true;
      final result = await Gemini.instance.prompt(parts: [
        Part.text(prompt.value),
      ]);
      response.value = result?.output ?? 'No response received';
    } catch (e) {
      response.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

class AskAi extends StatelessWidget {
  AskAi({super.key});

  final AskAiController controller = Get.put(AskAiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Tontro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ask AI...',
                ),
                onChanged: (value) {
                  controller.prompt.value = value; // Update the prompt
                },
              ),
              const SizedBox(height: 20),
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            await controller.sendPrompt();
                          },
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Center(child: const Text('Ask', style: TextStyle(fontSize: 16, color: Colors.black))),
                  )),
              
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Obx(() => Text(
                      controller.response.value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}