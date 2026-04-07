import 'package:whatsapp/data/enum/message_status.dart';
import 'package:whatsapp/data/model/chat.dart';

class LocalChatDataProvider {
  static List<Chat> messages = [
    Chat(
      name: "宝贝",
      message: "bǎobèi gy cakti y? 🥺 <3 <3 <3",
      timeInMillis: 1775101234000,
      isMe: false,
      status: MessageStatus.sent,
    ),
    Chat(
      name: "Andi",
      message: "Cen, tugas udah belum?",
      timeInMillis: 1775123456000,
      isMe: false,
      status: MessageStatus.delivered,
    ),
    Chat(
      name: "Yeye",
      message: "lagi di jalan hehe",
      timeInMillis: 1775156789000,
      isMe: true,
      status: MessageStatus.read,
    ),
    Chat(
      name: "Ruikee",
      message: "nanti jadi kan meeting?",
      timeInMillis: 1775200001000,
      isMe: false,
      status: MessageStatus.read,
    ),
    Chat(
      name: "Budi",
      message: "gw kirim filenya ya",
      timeInMillis: 1775234567000,
      isMe: false,
      status: MessageStatus.sent,
    ),
    Chat(
      name: "Tiwei",
      message: "iyaa sabar dong akh",
      timeInMillis: 1775259999000,
      isMe: true,
      status: MessageStatus.read,
    ),
    Chat(
      name: "Kevin",
      message: "malam ini mabar ga?",
      timeInMillis: 1775281234000,
      isMe: false,
      status: MessageStatus.delivered,
    ),
    Chat(
      name: "Rina",
      message: "aku udah sampe nih",
      timeInMillis: 1775298765000,
      isMe: false,
      status: MessageStatus.read,
    ),
    Chat(
      name: "Mono",
      message: "mauuu aku laper banget 😭",
      timeInMillis: 1775312345000,
      isMe: true,
      status: MessageStatus.read,
    ),
    Chat(
      name: "Dika",
      message: "link zoom mana ya?",
      timeInMillis: 1775329999000,
      isMe: false,
      status: MessageStatus.sent,
    ),
    Chat(
      name: "Lina",
      message: "besok jangan lupa yaa",
      timeInMillis: 1775338888000,
      isMe: false,
      status: MessageStatus.delivered,
    ),
    Chat(
      name: "Siti",
      message: "hehe tapi lucu kan?",
      timeInMillis: 1775346000000,
      isMe: true,
      status: MessageStatus.read,
    ),
  ];
}
