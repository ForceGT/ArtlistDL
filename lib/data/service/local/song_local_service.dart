import 'dart:typed_data';

abstract class SongLocalService {
  Future<bool> saveSongToFile(String fileName, Uint8List song);

  Future<List<String>> readIdsFromFile(String fileName);
}
