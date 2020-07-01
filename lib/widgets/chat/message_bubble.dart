import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String userName;
  final bool isMe;
  final Key key;
  MessageBubble(
    this.message,
    this.isMe,
    this.userName, {
    this.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          !isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: isMe
                ? Theme.of(context).buttonColor
                : Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
              bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                message,
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
