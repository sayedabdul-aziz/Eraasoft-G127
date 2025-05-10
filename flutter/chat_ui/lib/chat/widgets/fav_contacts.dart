import 'package:chat_ui/chat/model/user_model.dart';
import 'package:flutter/material.dart';

class FavContacts extends StatelessWidget {
  const FavContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Favorite Contacts',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: Row(
                      children: [
                        if (index == 0) const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(users[index].imageUrl)),
                                const Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.indigo,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(users[index].name.split(' ').first,
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: users.length),
          ),
        ],
      ),
    );
  }
}
