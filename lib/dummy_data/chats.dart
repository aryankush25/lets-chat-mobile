import '../models/contact.dart';
import '../models/chat.dart';

final dummyChats = [
  Chat(
    user: Contact(
      id: 'contact-0',
      name: 'Aryan Agarwal',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hiii',
    sentTime: DateTime.parse('2021-03-03 13:27:00,123456789z'),
    sentByMe: false,
  ),
  Chat(
    user: Contact(
      id: 'contact-1',
      name: 'Baburao Ganpatrao Apte!! Yeh mera style hai',
      status: 'Khopdi tood sale ka!',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 10',
    sentByMe: true,
    sentTime: DateTime.parse('2021-03-02 13:27:00,023456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-2',
      name: 'Ruchika Gupta',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 11',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,123456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-3',
      name: 'Nayan JD',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 12',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,223456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-4',
      name: 'Gaurav',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 13',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,323456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-5',
      name: 'John Wick',
      status: 'I love my dog.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 14',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,423456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-6',
      name: 'Kabir Singh',
      status: 'I am a surgeon.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 15',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,523456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-7',
      name: 'Ragnar Lothbroke',
      status: 'Who want\'s to be king?',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 16',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,623456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-8',
      name: 'Tommy Shelby',
      status: 'Fooock Linda!',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 17',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,723456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-9',
      name: 'Michael Scofield',
      status: 'Prison Break',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 18',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,823456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-10',
      name: 'Aryan Agarwal',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 19',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,923456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-11',
      name: 'Baburao Ganpatrao Apte',
      status: 'Khopdi tood sale ka!',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 110',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1023456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-12',
      name: 'Ruchika Gupta',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 111',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1123456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-13',
      name: 'Nayan JD',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 112',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1223456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-14',
      name: 'Gaurav',
      status: 'Hey there! I am using Let\s chat.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 113',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1323456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-15',
      name: 'John Wick',
      status: 'I love my dog.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 114',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1423456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-16',
      name: 'Kabir Singh',
      status: 'I am a surgeon.',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 115',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1523456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-17',
      name: 'Ragnar Lothbroke',
      status: 'Who want\'s to be king?',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 116',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1623456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-18',
      name: 'Tommy Shelby',
      status: 'Fooock Linda!',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 117',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1723456789z'),
  ),
  Chat(
    user: Contact(
      id: 'contact-19',
      name: 'Michael Scofield',
      status: 'Prison Break',
      imageUrl: 'https://www.w3schools.com/howto/img_avatar.png',
    ),
    lastMessage: 'Hello 118',
    sentByMe: true,
    sentTime: DateTime.parse('2012-02-27 13:27:00,1823456789z'),
  ),
];
