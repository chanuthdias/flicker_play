import 'package:flicker_play/constants.dart';
import 'package:flutter/material.dart';

import '../models/tv_sereies.dart';
import '../pages/tv_series_details_screen.dart';

class TvCard extends StatefulWidget {
  final Results tv;

  const TvCard({super.key, required this.tv});

  @override
  State<TvCard> createState() => _TvCardState();
}

class _TvCardState extends State<TvCard> {
  String lBaseImgPath = Constants.lBaseImgPath;
  @override
  Widget build(BuildContext context) {
    var tvItem = widget.tv;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TvSeriesDetailsScreen(
                    tvData: widget.tv,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 280,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  lBaseImgPath + tvItem.posterPath!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text(tvItem.originalName!,
                  style: const TextStyle(color: Colors.white)),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tvItem.voteAverage.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(Icons.favorite)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
