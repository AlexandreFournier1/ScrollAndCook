import 'package:dto/model/message.dart';

String generateId(String de, String a) {
  final now = DateTime.now().microsecondsSinceEpoch;
  final random = DateTime.now().millisecondsSinceEpoch.remainder(1000000);
  return '${de}_${a}${now.toRadixString(36)}${random.toRadixString(36)}';
}


final List<Message> messagesAda_Kyle = [
  Message(
    id: generateId('AdaWong1', 'KyleCrane'),
    type: 'text',
    text: 'Salut 👋',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong2', 'KyleCrane'),
    type: 'text',
    text: 'Hey ! Ça va ?',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong3', 'KyleCrane'),
    type: 'text',
    text: 'Oui nickel, et toi ?',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong4', 'KyleCrane'),
    type: 'text',
    text: 'Très bien 😄',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong5', 'KyleCrane'),
    type: 'text',
    text: 'Tu cuisines ce soir ?',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
];
final List<Message> messagesKyle_Ada = [
  Message(
    id: generateId('AdaWong', 'KyleCrane1'),
    type: 'text',
    text: 'Salut 👋',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'KyleCrane2'),
    type: 'text',
    text: 'Hey ! Ça va ?',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'KyleCrane3'),
    type: 'text',
    text: 'Oui nickel, et toi ?',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'KyleCrane4'),
    type: 'text',
    text: 'Très bien 😄',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'KyleCrane5'),
    type: 'text',
    text: 'Tu cuisines ce soir ?',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
];
final List<Message> messagesAda_Mikaela = [
  Message(
    id: generateId('AdaWong1', 'MikaelaReid'),
    type: 'text',
    text: 'Regarde cette recette 👀',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong2', 'MikaelaReid'),
    type: 'text',
    text: 'Elle est super simple à faire',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong3', 'MikaelaReid'),
    type: 'text',
    text: 'Tu devrais aimer 😋',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong4', 'MikaelaReid'),
    type: 'text',
    text: 'On la teste ensemble ?',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong5', 'MikaelaReid'),
    type: 'text',
    text: 'Dis-moi 👍',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
];
final List<Message> messagesMikaela_Ada = [
  Message(
    id: generateId('AdaWong', 'MikaelaReid1'),
    type: 'text',
    text: 'Regarde cette recette 👀',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'MikaelaReid2'),
    type: 'text',
    text: 'Elle est super simple à faire',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'MikaelaReid3'),
    type: 'text',
    text: 'Tu devrais aimer 😋',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'MikaelaReid4'),
    type: 'text',
    text: 'On la teste ensemble ?',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('AdaWong', 'MikaelaReid5'),
    type: 'text',
    text: 'Dis-moi 👍',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
];
final List<Message> messagesKyle_Mikaela = [
  Message(
    id: generateId('KyleCrane1', 'MikaelaReidId'),
    type: 'text',
    text: 'J’ai testé une nouvelle recette',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane2', 'MikaelaReidId'),
    type: 'text',
    text: 'Pâtes bolognaise maison',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane3', 'MikaelaReidId'),
    type: 'text',
    text: 'Simple mais efficace 😄',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane4', 'MikaelaReidId'),
    type: 'text',
    text: 'Tu devrais essayer',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane5', 'MikaelaReidId'),
    type: 'text',
    text: 'Je te passe la recette',
    isSentByMe: true,
    createdAt: DateTime.now(),
  ),
];
final List<Message> messagesMikaela_Kyle = [
  Message(
    id: generateId('KyleCrane', 'MikaelaReidId1'),
    type: 'text',
    text: 'J’ai testé une nouvelle recette',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane', 'MikaelaReidId2'),
    type: 'text',
    text: 'Pâtes bolognaise maison',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane', 'MikaelaReidId3'),
    type: 'text',
    text: 'Simple mais efficace 😄',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane', 'MikaelaReidId4'),
    type: 'text',
    text: 'Tu devrais essayer',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
  Message(
    id: generateId('KyleCrane', 'MikaelaReidId5'),
    type: 'text',
    text: 'Je te passe la recette',
    isSentByMe: false,
    createdAt: DateTime.now(),
  ),
];
