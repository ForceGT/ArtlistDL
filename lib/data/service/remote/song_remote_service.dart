import 'package:artlist_dl/data/model/album_detail_response.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:http/http.dart';

abstract class SongRemoteService {
  Future<SongDetailResponse> getSingleSongInfoFromId({required String songId});

  Future<AlbumDetailResponse> getAlbumInfoFromId({required String albumId});

  Future<StreamedResponse> getmp3StreamFromUrl({required String url});
}
