import 'package:flutter/material.dart';

class GmailScreen extends StatelessWidget {
  const GmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FB),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black54),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'Search in mail',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          'T',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Category chips
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildChip('Primary', Icons.inbox, true),
                  const SizedBox(width: 8),
                  _buildChip('Promotions', Icons.local_offer_outlined, false),
                  const SizedBox(width: 8),
                  _buildChip('Social', Icons.people_outline, false),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Email list
            Expanded(
              child: ListView(
                children: [
                  _buildEmailTile(
                    'Google',
                    'Security alert',
                    'A new sign-in on your account was detected...',
                    '10:30 AM',
                    Colors.red,
                    true,
                  ),
                  _buildEmailTile(
                    'LinkedIn',
                    'New job recommendations',
                    'Based on your profile, we found 5 new jobs...',
                    '9:15 AM',
                    Colors.blue,
                    true,
                  ),
                  _buildEmailTile(
                    'GitHub',
                    'Your pull request was merged',
                    'Congratulations! Your PR #42 has been merged...',
                    'Yesterday',
                    Colors.black87,
                    false,
                  ),
                  _buildEmailTile(
                    'Prof. Ahmed',
                    'SMD Assignment Update',
                    'Dear students, the deadline for the assignment...',
                    'Yesterday',
                    Colors.teal,
                    true,
                  ),
                  _buildEmailTile(
                    'Netflix',
                    'New arrivals this week',
                    'Check out the latest shows and movies added...',
                    'Feb 14',
                    Colors.red.shade800,
                    false,
                  ),
                  _buildEmailTile(
                    'Stack Overflow',
                    'Your question got an answer',
                    'Someone answered your question about Flutter...',
                    'Feb 14',
                    Colors.orange,
                    false,
                  ),
                  _buildEmailTile(
                    'University',
                    'Exam Schedule Released',
                    'The final exam schedule for Spring 2026...',
                    'Feb 13',
                    Colors.indigo,
                    true,
                  ),
                  _buildEmailTile(
                    'Amazon',
                    'Your order has shipped',
                    'Your package is on its way and will arrive...',
                    'Feb 12',
                    Colors.amber.shade800,
                    false,
                  ),
                  _buildEmailTile(
                    'Spotify',
                    'Your 2026 playlist is ready',
                    'We have curated a special playlist based on...',
                    'Feb 11',
                    Colors.green,
                    false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.mail_outlined),
            selectedIcon: Icon(Icons.mail),
            label: 'Mail',
          ),
          NavigationDestination(
            icon: Icon(Icons.videocam_outlined),
            selectedIcon: Icon(Icons.videocam),
            label: 'Meet',
          ),
        ],
      ),

      // FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFEAF1FB),
        icon: const Icon(Icons.edit_outlined, color: Colors.black87),
        label: const Text(
          'Compose',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildChip(String label, IconData icon, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFD3E3FD) : const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.circular(8),
        border: selected
            ? Border.all(color: Colors.blue.shade200)
            : Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: selected ? Colors.blue.shade800 : Colors.black54),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? Colors.blue.shade800 : Colors.black54,
              fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTile(
    String sender,
    String subject,
    String preview,
    String time,
    Color avatarColor,
    bool isUnread,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: avatarColor,
        child: Text(
          sender[0].toUpperCase(),
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              sender,
              style: TextStyle(
                fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              color: isUnread ? Colors.black87 : Colors.grey,
              fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
              fontWeight: isUnread ? FontWeight.w600 : FontWeight.normal,
              fontSize: 13,
              color: Colors.black87,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            preview,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      trailing: const Icon(Icons.star_border, color: Colors.grey, size: 20),
    );
  }
}
