import 'package:flutter/material.dart';

import '../models/tv_sereies.dart';

class TvCard extends StatefulWidget {
  final Results tv;

  const TvCard({super.key, required this.tv});

  @override
  State<TvCard> createState() => _TvCardState();
}

class _TvCardState extends State<TvCard> {
  String lBaseImgPath = "https://image.tmdb.org/t/p/w500";
  String oImgBasePath = "https://image.tmdb.org/t/p/original";
  @override
  Widget build(BuildContext context) {
    var tvItem = widget.tv;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 280,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              lBaseImgPath + tvItem.posterPath!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Text(tvItem.originalName!),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tvItem.voteAverage.toString()),
                  const Icon(Icons.favorite)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
