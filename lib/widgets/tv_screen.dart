import 'package:flicker_play/widgets/tv_card.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/tv_sereies.dart';
import '../services/api_services.dart';
import '../utills/end_points.dart';

class TVScreen extends StatefulWidget {
  const TVScreen({super.key});

  @override
  State<TVScreen> createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Airing Today.....",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.airToday),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TvSeries tvseries = TvSeries.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: tvseries.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return TvCard(tv: tvseries.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
          const Text(
            "Popular Tv Sereies.....",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.popularTv),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TvSeries tvseries = TvSeries.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: tvseries.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return TvCard(tv: tvseries.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
          const Text(
            "Top Rated Tv Sereies.....",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          FutureBuilder(
              future: ApiServices().get(apiEndPoint: EndPoints.topRatedTv),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  TvSeries tvseries = TvSeries.fromJson(snapshot.data!);
                  return SizedBox(
                    height: 280,
                    width: 500,
                    child: ListView.builder(
                        itemCount: tvseries.results!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return TvCard(tv: tvseries.results![index]);
                        }),
                  );
                }
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
