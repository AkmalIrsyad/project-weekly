import 'package:flutter/material.dart';
import 'package:whatsapp/utils/color.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key, required this.onSubmit});

  final Function(String) onSubmit;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();

}

class _ChatInputFieldState extends State<ChatInputField> {

  final TextEditingController _controller = TextEditingController();
  IconData actionIcon = Icons.mic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          setState(() {
                            // Kalo ada text ubah dari mic ke send
                            actionIcon = value.isNotEmpty ? Icons.send : Icons.mic;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: "Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.grey),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.camera_alt, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                if (_controller.text.isNotEmpty) {
                  widget.onSubmit(_controller.text);
                  _controller.clear();

                  setState(() {
                    actionIcon = Icons.mic;
                  });
                }
              },
              child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.green,
                child: Icon(
                  actionIcon,
                  color: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
