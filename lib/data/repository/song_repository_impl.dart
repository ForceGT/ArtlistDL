import 'dart:typed_data';

import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:artlist_dl/data/repository/song_repository.dart';
import 'package:artlist_dl/data/service/local/song_local_service.dart';
import 'package:artlist_dl/data/service/remote/song_remote_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SongRepositoryImpl implements SongRepository {
  SongRemoteService remoteService;
  SongLocalService localService;

  SongRepositoryImpl({required this.remoteService, required this.localService});

  @override
  Future<List<SongDetailResponse>> getSongInfoFromAlbum({required String albumId}) async {
    var albumInfo = await remoteService.getAlbumInfoFromId(albumId: albumId);
    debugPrint("AlbumInfo: $albumInfo");
    if (albumInfo.songs != null) {
      return albumInfo.songs!;
    } else {
      return [];
    }
  }

  @override
  Future<List<SongDetailResponse>> getSingleSongInfo({required String songId}) async {
    var songDetail = await remoteService.getSingleSongInfoFromId(songId: songId);
    return [songDetail];
  }

  @override
  Future<StreamedResponse> getMp3Stream({required String url}) async {
    var response = await remoteService.getmp3StreamFromUrl(url: url);
    return response;
  }

  @override
  Future<bool> saveSongToFile({required String fileName, required Uint8List song}) {
    return localService.saveSongToFile(fileName, song);
  }
}
