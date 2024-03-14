import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/tv_sereies.dart';

class TvSeriesDetailsScreen extends StatefulWidget {
  final Results tvData;
  const TvSeriesDetailsScreen({super.key, required this.tvData});

  @override
  State<TvSeriesDetailsScreen> createState() => _TvSeriesDetailsScreenState();
}

class _TvSeriesDetailsScreenState extends State<TvSeriesDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            Constants.lBaseImgPath + widget.tvData.posterPath!,
            width: screenWidth,
            height: 250,
            fit: BoxFit.cover,
          ),
          Text(
            widget.tvData.originalName!,
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            widget.tvData.overview!,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
