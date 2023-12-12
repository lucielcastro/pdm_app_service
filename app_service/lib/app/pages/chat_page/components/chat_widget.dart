import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/const_colors.dart';

class Message {
  final String text;
  final DateTime timestamp;

  Message({required this.text, required this.timestamp});
}

class ChatWidGet extends StatefulWidget {
  const ChatWidGet({super.key});

  @override
  State<ChatWidGet> createState() => _ChatWidGetState();
}

class _ChatWidGetState extends State<ChatWidGet> {
  final TextEditingController _textController = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage() {
    if (_textController.text.trim().isEmpty) {
      return;
    }

    final Message message = Message(
      text: _textController.text,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(message);
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * .40,
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Você',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy HH:mm')
                            .format(message.timestamp),
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  subtitle: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 60, 129, 78),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      message.text,
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 228, 225, 225)),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: ConstColors.backgroundGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.emoji_emotions_outlined,
                              color: ConstColors.cutGrey, size: 20)),
                      PopupMenuButton<void Function()>(
                          padding: EdgeInsets.zero,
                          tooltip: "",
                          icon: Icon(Icons.attach_file,
                              color: ConstColors.cutGrey, size: 25),
                          onSelected: (value) => value(),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          itemBuilder: (_) => [
                                PopupMenuItem(
                                    enabled: false,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 7),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.image_outlined,
                                              color: ConstColors.cutGrey,
                                              size: 25),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Fotos",
                                            style: TextStyle(
                                                color: ConstColors.cutGrey,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                    )),
                                PopupMenuItem(
                                    enabled: false,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 7),
                                    child: Row(
                                      children: [
                                        Icon(Icons.file_copy,
                                            color: ConstColors.cutGrey,
                                            size: 25),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Documento",
                                          style: TextStyle(
                                              color: ConstColors.cutGrey,
                                              fontSize: 13),
                                        ),
                                      ],
                                    )),
                              ]),
                      Expanded(
                          child: TextField(
                        controller: _textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            hintText: 'Mensagem',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: InputBorder.none),
                      )),
                      IconButton(
                          onPressed: _sendMessage,
                          icon: const Icon(Icons.send,
                              color: ConstColors.cutGrey, size: 26)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .02,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
