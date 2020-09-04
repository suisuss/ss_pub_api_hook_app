import 'package:flutter/material.dart';
import 'package:ss_pub_api_hook_app/models/message.dart';
import 'package:ss_pub_api_hook_app/screens/message_detail/text_section.dart';

class MessageDetail extends StatefulWidget {
  final int messageID;

  const MessageDetail(this.messageID);

  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  Future<Message> future;
  Message message;

  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    future = Message.fetchMessageByID(widget.messageID);
    message = await future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('S.S - PUB / API / MESSAGE'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                    if (snapshot.hasError)
                      return Text('Error: ${snapshot.error}');
                    var message = snapshot.data;
                    return Column(children: <Widget>[
                      TextSection(message.name, message.phone,
                          message.dateSubmitted, message.email, message.body)
                    ]);
                }
              }),
        ));
  }
}
