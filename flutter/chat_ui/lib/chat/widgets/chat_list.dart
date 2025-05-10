import 'package:chat_ui/chat/model/user_model.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: const Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  )
                ],
              ),
              title: Text(users[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.indigo)),
              subtitle: Text(
                users[index].messageText,
              ),
              trailing: Text(users[index].time, style: const TextStyle()),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: users.length),
    ));
  }
}
