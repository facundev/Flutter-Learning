import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/him_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://static.wikia.nocookie.net/gta/images/f/fb/NikoBellic-GTAIV.jpg/revision/latest?cb=20200122075112&path-prefix=it'),
            ),
          ),
          title: const Text('Niko')),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];

                      return (message.fromWho == FromWho.him)
                          ? HimMessageBubble(message: message) // Si es de él, mostrar su bubble
                          : MyMessageBubble(message: message); // Si es mio, mostrar mi bubble
                    })),
            MessageFieldBox(
              // onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
