import 'package:flutter/material.dart';

class ComunitiesScreen extends StatefulWidget {
  const ComunitiesScreen({super.key});

  @override
  State<ComunitiesScreen> createState() => _ComunitiesScreenState();
}

class _ComunitiesScreenState extends State<ComunitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Comunities Screen')));
  }
}
