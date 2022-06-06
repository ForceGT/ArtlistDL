import 'dart:typed_data';

import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:http/http.dart';

abstract class SongRepository {
  Future<List<SongDetailResponse>> getSingleSongInfo({required String songId});

  Future<List<SongDetailResponse>> getSongInfoFromAlbum({required String albumId});

  Future<StreamedResponse> getMp3Stream({required String url});

  Future<bool> saveSongToFile({required String fileName, required Uint8List song});
}
