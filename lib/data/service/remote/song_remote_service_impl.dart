import 'dart:convert';

import 'package:artlist_dl/data/model/album_detail_response.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:artlist_dl/data/service/remote/song_remote_service.dart';
import 'package:artlist_dl/util/config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SongRemoteServiceImpl implements SongRemoteService {
  @override
  Future<AlbumDetailResponse> getAlbumInfoFromId({required String albumId}) async {
    var url = Config.albumApiPath.replaceAll("{id}", albumId);
    debugPrint('Getting album info from $url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return AlbumDetailResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to get album info');
    }
  }

  @override
  Future<SongDetailResponse> getSingleSongInfoFromId({required String songId}) async {
    var url = Config.songApiPath.replaceAll("{id}", songId);
    print('Getting single song info from $url');
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return SongDetailResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to get song info');
    }
  }

  @override
  Future<http.StreamedResponse> getmp3StreamFromUrl({required String url}) async {
    var client = http.Client();
    var streamedResponse = await client.send(http.Request("GET", Uri.parse(url)));
    if (streamedResponse.statusCode == 200) {
      return streamedResponse;
    } else {
      debugPrint('Response: ${streamedResponse.statusCode}');
      throw Exception('Failed to get mp3');
    }
  }
}
