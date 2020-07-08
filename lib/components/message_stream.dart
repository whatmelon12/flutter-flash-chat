import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  final FirebaseUser user;
  final Stream<QuerySnapshot> messageStream;

  MessageStream({@required this.user, @required this.messageStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messageStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final widgets = snapshot.data.documents.reversed
              .map((message) => MessageBubble(
                    message: message.data['text'],
                    sender: message.data['sender'],
                    isMe: message.data['sender'] == user.email,
                  ))
              .toList();
          return Expanded(
            child: ListView(
              reverse: true,
              children: widgets,
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
