import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jualan/controllers/disscusion_controller.dart';

class DisscusionPage extends GetView<DisscusionController> {
  const DisscusionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DisscusionController());
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Text(message.content),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                    onChanged: (value) {
                      controller.updateMessageContent(value);
                    },
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.add),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.image),
                        title: const Text('Pick Image'),
                        onTap: () {
                          controller.pickImage();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.attach_file),
                        title: const Text('Pick Document'),
                        onTap: () {
                          controller.pickDocument();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.mic),
                        title: const Text('Record Voice'),
                        onTap: () {
                          controller.recordVoice();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: ListTile(
                        leading: const Icon(Icons.link),
                        title: const Text('Insert Link'),
                        onTap: () {
                          controller.insertLink();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    controller.showEmoticonKeyboard();
                  },
                  icon: const Icon(Icons.emoji_emotions),
                ),
                IconButton(
                  onPressed: () {
                    controller.sendMessage(
                        'Me', controller.messageContent.value);
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
