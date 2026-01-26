import 'package:flutter/material.dart';

class ChapterListScreen extends StatelessWidget {
  const ChapterListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F11),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(234, 228, 223, 223),
        elevation: 0,
        title: const Text("Chapters"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            chapterCard(
              chapterNumber: 1,
              title: "Chapter 1. Arjun Viṣhād Yog",
              subtitle: "47 Verses • 8% Completed",
              showProgress: true,
              progress: 0.08,
            ),
            chapterCard(
              chapterNumber: 2,
              title: "Chapter 2. Sānkhya Yog",
              subtitle: "72 Verses",
            ),
            chapterCard(
              chapterNumber: 3,
              title: "Chapter 3. Karm Yog",
              subtitle: "43 Verses",
            ),
            chapterCard(
              chapterNumber: 4,
              title: "Chapter 4. Jñāna Karm Sanyās Yog",
              subtitle: "42 Verses",
            ),
          ],
        ),
      ),
    );
  }
}
Widget chapterCard({
  required int chapterNumber,
  required String title,
  required String subtitle,
  double progress = 0, // optional
  bool showProgress = false,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFF1C1C1E),
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Row(
      children: [
        // Chapter Number Box
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.orange, width: 1.5),
          ),
          child: Center(
            child: Text(
              chapterNumber.toString(),
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 14),

        // Text Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade400,
                ),
              ),

              if (showProgress) ...[
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade800,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "${(progress * 100).toInt()}%",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ]
            ],
          ),
        ),

        const Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
          size: 18,
        )
      ],
    ),
  );
}
