import 'package:artlist_dl/data/model/song_detail_response.dart';

class AlbumDetailResponse {
  List<SongDetailResponse>? songs;
  String? albumName;
  String? artistDisplayName;

  AlbumDetailResponse._({
    this.songs,
    this.albumName,
    this.artistDisplayName,
  });

  factory AlbumDetailResponse.fromJson(Map<String, dynamic> json) {
    final allSongsJson = json["songs"] as List;
    return AlbumDetailResponse._(
        songs: allSongsJson.map((jsonSong) => SongDetailResponse.fromJson(jsonSong)).toList(),
        albumName: json["albumName"],
        artistDisplayName: json["artistDisplayName"]);
  }

  @override
  String toString() {
    return 'AlbumDetailResponse{'
        'songs: $songs,'
        'albumName: $albumName';
  }
}
