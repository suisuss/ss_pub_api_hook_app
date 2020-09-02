import 'package:flutter/material.dart';
import 'package:ss_pub_api_hook_app/screens/messages/messages.dart';

class APIIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              title: Text('S.S - PUB / API'),
              bottom: TabBar(tabs: <Widget>[
                Tab(
                  text: 'Messages',
                ),
              ]),
            ),
            body: TabBarView(
              children: <Widget>[
                MessagesList(),
              ],
            )));
  }
}
