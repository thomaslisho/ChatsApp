import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          final documents = snapshot.data.documents;
          return ListView.builder(
            itemBuilder: (context, index) => Container(
              child: Text(documents[index]['text']),
              padding: EdgeInsets.all(8),
            ),
            itemCount: documents.length,
          );
        },
        stream: Firestore.instance
            .collection('chats/v2oWQewdxp6fYhh7KsDT/messages')
            .snapshots(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance
              .collection('chats/v2oWQewdxp6fYhh7KsDT/messages')
              .add({'text': 'This was added clicking the button man'});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
