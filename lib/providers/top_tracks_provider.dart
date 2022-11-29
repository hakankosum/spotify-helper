import 'package:ff/services/get_top_tracks.dart';
import 'package:flutter/cupertino.dart';

import '../models/top_tracks_model.dart';

class TopTracksProvider extends ChangeNotifier {
  bool isLoaded = false;
  TopTracksModel? data;
  String? id;
  int totalTrack = 0;
  List<String> duration = [];

  GetTopTracks(id) async {
    data = await GetTopTracksService(id!);
    for (var i = 0; i < data!.tracks!.length; i++) {
      totalTrack = totalTrack + (data!.tracks![i].album!.totalTracks!.toInt());
    }

    for (var i = 0; i < data!.tracks!.length; i++) {
      duration.add(((int.parse(
                  (data!.tracks![i].durationMs! ~/ 60000).toString())))//calculate min data
              .toString() +
          ":" +
          ((data!.tracks![i].durationMs! % 60000)*0.6).toString().substring(0,2));//calculate sec data
    }

    isLoaded = true;
    notifyListeners();
  }
}
