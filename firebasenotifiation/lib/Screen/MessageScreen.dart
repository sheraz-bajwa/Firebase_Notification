import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasenotifiation/Screen/Landing.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.id});
  final String id;
  @override
  State<MessageScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Messaging Screen'),
      ),
      body: Center(child: Column(
        children: [
          Text(widget.id),
          Text(widget.id),
        ],
      )),
    );
  }
}
