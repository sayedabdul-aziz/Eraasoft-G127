import 'package:chat_ui/chat/widgets/chat_list.dart';
import 'package:chat_ui/chat/widgets/fav_contacts.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Chats',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: const Column(
        children: [
          FavContacts(),
          ChatList(),
        ],
      ),
    );
  }
}
