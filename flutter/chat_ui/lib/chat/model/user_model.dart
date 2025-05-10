class UserModel {
  final String name;
  final String messageText;
  final String imageUrl;
  final String time;
  final bool isOnline;

  UserModel({
    required this.name,
    required this.messageText,
    required this.imageUrl,
    required this.time,
    required this.isOnline,
  });
}

List<UserModel> users = [
  UserModel(
      name: 'Ahmed Hassan',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: true),
  UserModel(
      name: 'Zaki Hassan',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: false),
  UserModel(
    name: 'Amira Hassan',
    messageText: 'Hello, how are you?',
    imageUrl:
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    time: '12:00 PM',
    isOnline: true,
  ),
  UserModel(
      name: 'Ahmed Tarek',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: true),
  UserModel(
      name: 'Tarek Hassan',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: false),
  UserModel(
    name: 'Ahmed Ali',
    messageText: 'Hello, how are you?',
    imageUrl:
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    time: '12:00 PM',
    isOnline: false,
  ),
  UserModel(
      name: 'Ahmed Hassan',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: true),
  UserModel(
      name: 'Zaki Hassan',
      messageText: 'Hello, how are you?',
      imageUrl:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      time: '12:00 PM',
      isOnline: false),
  UserModel(
    name: 'Amira Hassan',
    messageText: 'Hello, how are you?',
    imageUrl:
        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    time: '12:00 PM',
    isOnline: true,
  ),
];
