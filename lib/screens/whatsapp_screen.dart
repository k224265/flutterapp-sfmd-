import 'package:flutter/material.dart';

class WhatsAppScreen extends StatelessWidget {
  const WhatsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF075E54),
        foregroundColor: Colors.white,
        title: const Text(
          'WhatsApp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'group', child: Text('New group')),
              const PopupMenuItem(value: 'broadcast', child: Text('New broadcast')),
              const PopupMenuItem(value: 'linked', child: Text('Linked devices')),
              const PopupMenuItem(value: 'starred', child: Text('Starred messages')),
              const PopupMenuItem(value: 'settings', child: Text('Settings')),
            ],
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: const Color(0xFF075E54),
            child: Row(
              children: [
                _buildTab('Chats', true),
                _buildTab('Updates', false),
                _buildTab('Calls', false),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          // Archived row
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.archive_outlined, color: Color(0xFF075E54), size: 20),
                SizedBox(width: 16),
                Text(
                  'Archived',
                  style: TextStyle(
                    color: Color(0xFF075E54),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Spacer(),
                Text(
                  '3',
                  style: TextStyle(
                    color: Color(0xFF25D366),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Chat list
          _buildChatTile(
            name: 'Ali Khan',
            message: 'Bhai assignment kar liya? 😅',
            time: '5:30 PM',
            unreadCount: 2,
            color: Colors.blue,
          ),
          _buildChatTile(
            name: 'SMD Group',
            message: 'Ahmed: Lab 2 ki deadline kab hai?',
            time: '4:45 PM',
            unreadCount: 15,
            color: Colors.teal,
            isGroup: true,
          ),
          _buildChatTile(
            name: 'Sara Ahmed',
            message: 'Thanks for the notes! 📚',
            time: '3:20 PM',
            unreadCount: 0,
            color: Colors.purple,
          ),
          _buildChatTile(
            name: 'University Notices',
            message: 'Admin: Exam schedule has been uploaded',
            time: '2:00 PM',
            unreadCount: 5,
            color: Colors.indigo,
            isGroup: true,
          ),
          _buildChatTile(
            name: 'Bilal Hassan',
            message: 'Flutter is amazing! 🚀',
            time: '1:15 PM',
            unreadCount: 0,
            color: Colors.orange,
          ),
          _buildChatTile(
            name: 'Mom',
            message: 'Beta khana kha liya?',
            time: '12:30 PM',
            unreadCount: 1,
            color: Colors.red,
          ),
          _buildChatTile(
            name: 'Project Team',
            message: 'You: I pushed the latest changes',
            time: '11:00 AM',
            unreadCount: 0,
            color: Colors.green,
            isGroup: true,
          ),
          _buildChatTile(
            name: 'Fatima Zahra',
            message: 'See you at the library tomorrow',
            time: 'Yesterday',
            unreadCount: 0,
            color: Colors.pink,
          ),
          _buildChatTile(
            name: 'Hassan Raza',
            message: '📷 Photo',
            time: 'Yesterday',
            unreadCount: 0,
            color: Colors.amber.shade800,
          ),
          _buildChatTile(
            name: 'Coding Club',
            message: 'Usman: Next meetup is on Friday',
            time: 'Yesterday',
            unreadCount: 0,
            color: Colors.deepPurple,
            isGroup: true,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildChatTile({
    required String name,
    required String message,
    required String time,
    required int unreadCount,
    required Color color,
    bool isGroup = false,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: color.withOpacity(0.2),
        child: isGroup
            ? Icon(Icons.group, color: color, size: 24)
            : Text(
                name[0],
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: unreadCount > 0 ? const Color(0xFF25D366) : Colors.grey,
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (unreadCount > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF25D366),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$unreadCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
