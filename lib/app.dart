// app.dart

import 'package:flutter/material.dart';
import 'screens/messages/messages.dart';
import 'screens/index.dart';
import 'screens/message_detail/message_detail.dart';
import 'style.dart';

const IndexRoute = '/';
const MessagesRoute = '/messages';
const MessageDetailRoute = '/message_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(onGenerateRoute: _routes(), theme: _themes());
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case IndexRoute:
          screen = APIIndex();
          break;
        case MessagesRoute:
          screen = MessagesList();
          break;
        case MessageDetailRoute:
          screen = MessageDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _themes() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(headline6: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        headline1: TitleTextStyle,
        bodyText1: Body1Style,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      primaryColor: Color(0xFF212529),
      accentColor: Color(0xFF212529),
      bottomAppBarColor: Color(0xFF212529),
    );
  }
}
