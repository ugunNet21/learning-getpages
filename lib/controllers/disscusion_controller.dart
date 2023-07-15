import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jualan/core/models/disscusion_model.dart';

class DisscusionController extends GetxController {
  RxList<Message> messages = <Message>[].obs;
  RxString messageContent = ''.obs;
  final ImagePicker _imagePicker = ImagePicker();
void updateMessageContent(String value){
  messageContent.value =value;
}

  void fetchMessageFromAPI() {}
  void sendMessage(String sender, String content) {
    final newMessage = Message(
      sender: sender,
      content: content,
      timestamp: DateTime.now(),
    );
    messages.add(newMessage);
    messageContent.value = '';
  }

  Future<void> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageMessage = Message(
        sender: 'Mee',
        content: pickedFile.path,
        timestamp: DateTime.now(),
      );
      messages.add(imageMessage);
    }
  }

  Future<void> pickDocument() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      final documentMessage = Message(
        sender: 'Me',
        content: file.path,
        timestamp: DateTime.now(),
      );
      messages.add(documentMessage);
    }
  }

  void recordVoice() {
    // Implementasi perekaman suara
  }

  void insertLink() {
    // Implementasi penambahan tautan
  }
  void showEmoticonKeyboard() {
    // Implementasi tampilan keyboard emotikon
  }
}
