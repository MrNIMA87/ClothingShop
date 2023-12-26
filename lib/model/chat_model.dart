import 'package:get/get.dart';

class ChatModel {
  String textMessage = '';
  String time = '08:04';
  bool oppositeUser = true;
  ChatModel({
    required this.textMessage,
    required this.time,
    required this.oppositeUser,
  });
}

RxList<ChatModel> messages = [
  ChatModel(
    textMessage:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    time: '08:04',
    oppositeUser: true,
  ),
  ChatModel(
    textMessage: '''hi i'm opposite User. im from Iran!
how are you?''',
    time: '08:04',
    oppositeUser: false,
  ),
  ChatModel(
    textMessage:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    time: '08:04',
    oppositeUser: true,
  ),
].obs;
