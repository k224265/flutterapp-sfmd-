// Roll Number: [Your Roll Number]
// Name: [Your Name]
// Group Number: [Your Group Number]
// Group Members:
//   - [Member 1 Name] - [Roll Number]
//   - [Member 2 Name] - [Roll Number]
//   - [Member 3 Name] - [Roll Number]
// SMD 2026 - Lab 2

import 'package:flutter/material.dart';
import 'screens/todo_list_screen.dart';
import 'screens/gmail_screen.dart';
import 'screens/whatsapp_screen.dart';
import 'screens/adaptive_layout_screen.dart';

void main() {
  runApp(const SMDLabsApp());
}

class SMDLabsApp extends StatelessWidget {
  const SMDLabsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMD 2026 Labs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMD 2026 - Lab 2'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            _buildNavCard(
              context,
              title: 'ToDo List App',
              subtitle: 'Simple ToDo list homepage UI',
              icon: Icons.checklist,
              color: Colors.purple,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoListScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              context,
              title: 'Gmail Replica',
              subtitle: 'Gmail home page UI',
              icon: Icons.mail,
              color: Colors.red,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GmailScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              context,
              title: 'WhatsApp Replica',
              subtitle: 'WhatsApp home page UI',
              icon: Icons.chat,
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const WhatsAppScreen()),
              ),
            ),
            const SizedBox(height: 12),
            _buildNavCard(
              context,
              title: 'Adaptive Layout',
              subtitle: 'Responsive design with portrait & landscape',
              icon: Icons.devices,
              color: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AdaptiveLayoutScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
