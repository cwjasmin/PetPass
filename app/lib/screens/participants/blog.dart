import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  _BlogScreenState createState() => _BlogScreenState();
}


class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBlogHeader(),
            const SizedBox(height: 20),
            _buildBlogPost(
              title: '10 Tips for Better Productivity',
              description: 'Discover how to maximize your productivity with these 10 essential tips.',
              imageUrl: 'https://source.unsplash.com/featured/?productivity',
            ),
            _buildBlogPost(
              title: 'Why Flutter is the Future of Mobile Development',
              description: 'Learn why Flutter is rapidly becoming the top choice for mobile developers.',
              imageUrl: 'https://source.unsplash.com/featured/?flutter',
            ),
            _buildBlogPost(
              title: 'How to Manage Stress in a Fast-Paced World',
              description: 'Strategies to keep stress at bay in today\'s busy environment.',
              imageUrl: 'https://source.unsplash.com/featured/?stress,management',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlogHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://source.unsplash.com/featured/?blog'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to the Blog',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Read the latest articles on technology, productivity, and wellness.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogPost({
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text('Read More'),
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
