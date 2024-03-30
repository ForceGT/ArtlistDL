import 'dart:convert';

import 'package:artlist_dl/data/model/album_detail_response.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:artlist_dl/data/service/remote/song_remote_service.dart';
import 'package:artlist_dl/util/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SongRemoteServiceImpl implements SongRemoteService {
  @override
  Future<AlbumDetailResponse> getAlbumInfoFromId({required String albumId}) async {
    throw Exception("Albums is not supported anymore, Please try downloading a song instead");
  }

  @override
  Future<SongDetailResponse> getSingleSongInfoFromId({required String songId}) async {

    var data = '''{"query":"\\nquery Songs(\$ids: [String!]!) {\\n  songs(ids: \$ids) {\\n    songName\\n    MP3FilePath\\n    songId\\n    artistDisplayName\\n    albumName\\n    duration\\n    sitePlayableFilePath\\n  }\\n}\\n","variables":{"ids":["$songId"]}}''';

    var dio = Dio();
    var response = await dio.request(
      Config.graphQLApi,
      options: Options(
        method: 'POST',
      ),
      data: data,
    );

    var jsonResponse = json.encode(response.data);

    if (response.statusCode == 200) {
      var mappedJsonResponse = jsonDecode(jsonResponse) as Map<String, dynamic>;
      return SongDetailResponse.fromJson(mappedJsonResponse);
    } else {
      throw Exception('Failed to get song info\n${response.statusMessage}');
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
      throw Exception('Failed to get mp3\n${streamedResponse}');
    }
  }
}
