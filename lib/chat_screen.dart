import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.redAccent,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
        title: Text('Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
//                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.lightBlueAccent,
                    width: 2.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                      onChanged: (value) {},
//                      decoration: InputDecoration(
//                        contentPadding: EdgeInsets.symmetric(
//                          vertical: 10.0,
//                          horizontal: 20.0,
//                        ),
//                        hintText: 'type your message here',
//                        border: InputBorder.none,
//                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: InputBorder.none,
                        hintText: 'input message',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        fillColor: Colors.white30,
                        filled: true,
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.send,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
