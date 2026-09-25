import 'package:flutter/material.dart';
import '../app.dart';
import '../models/home_arguments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as HomeArguments?;
    final userName = (args?.name != null && args!.name.isNotEmpty) ? args.name : 'james';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.camera_alt_outlined, color: Colors.white, size: 24),
          onPressed: () {},
        ),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tv_outlined, color: Colors.white, size: 22),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined, color: Colors.white, size: 22),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // Stories bar
          SizedBox(
            height: 92,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildStoryItem(userName, 'assets/images/profile.jpg', isUser: true),
                _buildStoryItem('alex_m', 'assets/images/story1.jpg'),
                _buildStoryItem('sophia_k', 'assets/images/story2.jpg'),
                _buildStoryItem('lucas_r', 'assets/images/story3.jpg'),
                _buildStoryItem('emma_w', 'assets/images/story4.jpg'),
              ],
            ),
          ),
          const Divider(color: Color(0xFF262626), height: 1),
          
          // Welcome Banner
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '👋 Welcome back, $userName!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),

          // Feed Post Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.grey[800],
                  backgroundImage: const AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(width: 8),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_horiz, color: Colors.white),
              ],
            ),
          ),

          // Feed Post Image with Padding/Margins added
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/post.png',
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 300,
                    width: double.infinity,
                    color: const Color(0xFF262626),
                    child: const Center(
                      child: Icon(Icons.image, size: 60, color: Colors.white38),
                    ),
                  );
                },
              ),
            ),
          ),

          // Post Action Buttons (Like, Comment, Share, Save)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.favorite_border, color: Colors.white, size: 24),
                const SizedBox(width: 16),
                const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 22),
                const SizedBox(width: 16),
                const Icon(Icons.send_outlined, color: Colors.white, size: 22),
                const Spacer(),
                const Icon(Icons.bookmark_border, color: Colors.white, size: 24),
              ],
            ),
          ),

          // Post Caption & Comments info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13),
                    children: [
                      TextSpan(
                        text: '$userName ',
                        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const TextSpan(
                        text: '#nature #beauty',
                        style: TextStyle(color: Color(0xFF0064E0)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Add a comment...',
                  style: TextStyle(color: Color(0xFF8E8E93), fontSize: 13),
                ),
                const SizedBox(height: 6),
                const Text(
                  '2 HOURS AGO',
                  style: TextStyle(color: Color(0xFF8E8E93), fontSize: 10),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Logged in User Card / Logout Section
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1C1C1E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF2C2C2E)),
            ),
            child: Column(
              children: [
                Text(
                  'Logged in as: $userName',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0064E0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.signin);
                    },
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Footer branding
          const Center(
            child: Text(
              'ITP107 - De Matta & Malana',
              style: TextStyle(color: Color(0xFF8E8E93), fontSize: 12),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: Container(
        height: 56,
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: const Icon(Icons.home_filled, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.orange, Colors.pinkAccent]),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
            IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white), onPressed: () {}),
            IconButton(icon: const Icon(Icons.person_outline, color: Colors.white), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  static Widget _buildStoryItem(String name, String assetPath, {bool isUser = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Colors.purple, Colors.pink, Colors.orange],
                  ),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: const Color(0xFF262626),
                  backgroundImage: AssetImage(assetPath),
                ),
              ),
              if (isUser)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF0064E0),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: const Icon(Icons.add, size: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
        ],
      ),
    );
  }
}