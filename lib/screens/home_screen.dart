import 'package:flutter/material.dart';
import 'package:flutter_practice2/models/webtoon_model.dart';
import 'package:flutter_practice2/services/api_service.dart';
import 'package:flutter_practice2/widgets/webtoon_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surfaceBright,
        title: const Text(
          "Toons",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot)),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              child: WebtoonCard(
                title: webtoon.title,
                thumb: webtoon.thumb,
                id: webtoon.id,
              ),
            ),
          ],
        );
      },
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
