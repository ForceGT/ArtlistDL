class SongDetailResponse {
  String? songId; //
  String? songName; //
  String? albumName; //
  String? artistDisplayName; //
  String? mP3FilePath; //
  String? sitePlayableFilePath;
  String? duration; //

  SongDetailResponse({
    this.songId,
    this.artistDisplayName,
    this.songName,
    this.mP3FilePath,
    this.albumName,
    this.duration,
    this.sitePlayableFilePath,
  });

  SongDetailResponse.fromJson(Map<String, dynamic> json) {
    songId = json['songId'].toString();
    artistDisplayName = json['artistDisplayName'];
    songName = json['songName'];
    mP3FilePath = json['MP3FilePath'];
    albumName = json['albumName'];
    duration = json['duration'];
    sitePlayableFilePath = json['sitePlayableFilePath'];
  }

  @override
  String toString() {
    return 'SongDetailResponse{'
        'songId: $songId,'
        'artistDisplayName: $artistDisplayName'
        'songName: $songName'
        'albumName: $albumName'
        'MP3FilePath: $mP3FilePath'
        'sitePlayableFilePath: $sitePlayableFilePath'
        '}';
  }

  @override
  int get hashCode {
    return songName.hashCode ^ songId.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SongDetailResponse && songName == other.songName && songId == other.songId;
  }
}
