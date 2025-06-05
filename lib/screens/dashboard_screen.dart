import 'package:flutter/material.dart';
import 'package:instant_extract/screens/ocr_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'icon': Icons.document_scanner, 'label': 'Smart Scan'},
      {'icon': Icons.picture_as_pdf, 'label': 'Pdf Viewer'},
      {'icon': Icons.slideshow, 'label': 'Ppt Viewer'},
      {'icon': Icons.more_horiz, 'label': 'Others'},
    ];

    final recentDocs = [
      {
        'title': 'Project Document pdf',
        'date': '20/12/2022',
        'accessed': '20/12/2022 22:12',
        'count': '3',
        'image': 'assets/images/text.jpg',
      },
      {
        'title': 'Scanned Document pdf',
        'date': '10/11/2022',
        'accessed': '10/11/2022 21:12',
        'count': '7',
        'image': 'assets/images/text.jpg',
      },
      {
        'title': 'Lecture Slides',
        'date': '02/10/2022',
        'accessed': '02/10/2022 20:12',
        'count': '5',
        'image': 'assets/images/text.jpg',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildToolSection(tools),
              const SizedBox(height: 20),
              _buildRecentSection(recentDocs),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OcrScreen()),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Welcome Clarence! 👋',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            'Let’s get started',
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildToolSection(List<Map<String, dynamic>> tools) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Tools", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: tools.map((tool) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey[200],
                    child: Icon(tool['icon'], color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  Text(tool['label'], style: const TextStyle(fontSize: 12)),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSection(List<Map<String, String>> docs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text("Recents", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 10),
        ...docs.map((doc) => _buildRecentItem(doc)).toList(),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildRecentItem(Map<String, String> doc) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Image.asset(doc['image']!, width: 50),
        title: Text(doc['title']!),
        subtitle: Text("Date Created: ${doc['date']}\nLast Accessed: ${doc['accessed']}"),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
