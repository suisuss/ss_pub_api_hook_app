import 'package:flutter/material.dart';
import 'package:ss_pub_api_hook_app/screens/messages/messages.dart';

class APIIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('S.S - PUB / API'),
      ),
      body: MessagesList(),
    );
  }
}
