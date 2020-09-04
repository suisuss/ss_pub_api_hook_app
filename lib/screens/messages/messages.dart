import 'package:flutter/material.dart';
import 'package:ss_pub_api_hook_app/app.dart';
import 'package:ss_pub_api_hook_app/models/message.dart';

class MessagesList extends StatefulWidget {
  const MessagesList({Key key}) : super(key: key);

  State<StatefulWidget> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  Future<List<Message>> messages;

  void initState() {
    super.initState();
    messages = Message.fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: messages,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            var messages = snapshot.data;
            return ListView.separated(
                itemCount: messages.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (BuildContext context, int index) {
                  Message message = messages[index];
                  return ListTile(
                    title: Text(message.name),
                    onTap: () {
                      Navigator.pushNamed(context, MessageDetailRoute,
                          arguments: {'id': message.id});
                    },
                    subtitle: Text(
                      message.body,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    isThreeLine: true,
                  );
                });
        }
      },
    ));
  }
}
