import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Message {
  final int id;
  final String dateSubmitted;
  final String body;
  final String phone;
  final String name;
  final String email;

  Message(this.body, this.dateSubmitted, this.email, this.phone, this.id,
      this.name);

  factory Message.fromJSON(Map<String, dynamic> json) {
    int id = json['id'];
    String dateSubmitted = json['date_submitted'];
    String body = json['body'];
    String email = json['email'];
    String name = json['name'];
    String phone = json['phone'];
    return Message(
      body,
      dateSubmitted,
      email,
      phone,
      id,
      name,
    );
  }

  static Future<List<Message>> fetchMessages() async {
    final response = await http.get('http://10.0.2.2:5000/api/messages');

    await Future.delayed(Duration(milliseconds: 500));

    List collection = json.decode(response.body)['messages'];
    List<Message> _messages =
        collection.map((json) => Message.fromJSON(json)).toList();
    return _messages;
  }

  static Future<Message> fetchMessageByID(int messageID) async {
    final response =
        await http.get('http://10.0.2.2:5000/api/message/$messageID');

    await Future.delayed(Duration(milliseconds: 500));

    var collection = json.decode(response.body);

    Message _message = Message.fromJSON(collection);

    return _message;
  }
}
