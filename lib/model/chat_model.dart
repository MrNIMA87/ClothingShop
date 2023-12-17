import 'package:clothing_shop/gen/assets.gen.dart';
import 'package:get/get.dart';

class ChatModel {
  String textMessage = '';
  String time = '08:04';
  String name = 'Nima Shams';
  String image = Assets.images.explore32.path;
  bool oppositeUser = true;
  ChatModel({
    required this.textMessage,
    required this.time,
     required this.name,
    required this.image,
    required this.oppositeUser,
  });
}

RxList<ChatModel> messages = [
  ChatModel(
    textMessage: '''hi i\'m opposite User. im from Iran!
how are you?''',
    time: '08:04',
    name: 'Reza Naseri',
    image: Assets.images.explore21.path,
    oppositeUser: true,
  ),
  ChatModel(
    textMessage: '''hi i\'m opposite User. im from Iran!
how are you?''',
    time: '08:04',
    name: 'Nima Shamsi',
    image: Assets.images.explore21.path,
    oppositeUser: false,
  ),
  ChatModel(
    textMessage: '''hi i\'m opposite User. im from Iran! demiofriogiegirhiorjhirtgeg,thotyhomyomjpgkokrep[ghhkotrhp[yrjyjkrsj[rsj]]]
how are you?''',
    time: '08:04',
    name: 'Reza Naseri',
    image: Assets.images.explore21.path,
    oppositeUser: true,
  ),
].obs;
