import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice2/screens/detail_screen.dart';

class WebtoonCard extends StatelessWidget {
  final String title, thumb, id;

  const WebtoonCard({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                title: title,
                thumb: thumb,
                id: id,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Hero(
              tag: id,
              child: Container(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        offset: Offset(0, 0),
                        color: Colors.black,
                      ),
                    ],
                  ),
                  child: Image.network(
                    thumb,
                    headers: const {
                      "User-Agent": "Mozilla/5.0",
                      "Referer": "https://comic.naver.com",
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
