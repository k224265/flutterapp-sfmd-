import 'package:flutter/material.dart';

class AdaptiveLayoutScreen extends StatelessWidget {
  const AdaptiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AdaptiveLayout();
  }
}

class _AdaptiveLayout extends StatelessWidget {
  const _AdaptiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Landscape: side-by-side navigation + content
        if (constraints.maxWidth > 600) {
          return _LandscapeLayout();
        }
        // Portrait: drawer navigation + stacked content
        return _PortraitLayout();
      },
    );
  }
}

// ============================================================
// LANDSCAPE LAYOUT (Page 3 screenshot)
// Navigation panel on left + main content on right
// ============================================================
class _LandscapeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Layout'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Row(
        children: [
          // Left Navigation Panel
          Container(
            width: 150,
            color: const Color(0xFFF3EDF7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  color: const Color(0xFFE8DEF8),
                  child: const Text(
                    'Navigation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const _NavItem(label: 'Dashboard'),
                const _NavItem(label: 'Messages'),
              ],
            ),
          ),

          // Right content area
          Expanded(
            child: Column(
              children: [
                // Blue header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xFF42A5F5),
                  child: Row(
                    children: [
                      const FlutterLogo(size: 28),
                      const SizedBox(width: 12),
                      Text(
                        'Header Content',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                // List items
                Expanded(
                  child: Container(
                    color: const Color(0xFFF9F5FD),
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _ContentListItem(index: index + 1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PORTRAIT LAYOUT (Page 4 screenshot)
// Hamburger menu with drawer + full-width header + list
// ============================================================
class _PortraitLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive Layout'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),

      // Drawer (Page 5 screenshot)
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Menu (ListView)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                title: const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                title: const Text(
                  'Messages',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),

      body: Column(
        children: [
          // Large blue header banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 24),
            color: const Color(0xFF42A5F5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 60),
                const SizedBox(width: 16),
                Text(
                  'Header Content',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.95),
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // List items
          Expanded(
            child: Container(
              color: const Color(0xFFF9F5FD),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _ContentListItem(index: index + 1);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Shared Widgets
// ============================================================

class _NavItem extends StatelessWidget {
  final String label;

  const _NavItem({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Text(
        label,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}

class _ContentListItem extends StatelessWidget {
  final int index;

  const _ContentListItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Main Item $index',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'Subtext goes here',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
