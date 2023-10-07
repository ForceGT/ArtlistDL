import 'dart:io';
import 'dart:typed_data';

import 'package:artlist_dl/data/service/local/song_local_service.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SongLocalServiceImpl implements SongLocalService {
  @override
  Future<List<String>> readIdsFromFile(String fileName) {
    // TODO: implement readIdsFromFile
    throw UnimplementedError();
  }

  @override
  Future<bool> saveSongToFile(String fileName, Uint8List song) async {
    try {
      final fileP = await getDownloadsDirectory();
      Directory("${fileP!.path}/Artlist").createSync();
      final timeStamp = DateTime.now().millisecondsSinceEpoch;
      File file = File("${fileP.path}/Artlist/${fileName}_$timeStamp.aac");
      debugPrint('Saving file to ${file.path}');
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(song);
      raf.closeSync();
      return true;
    } catch (e) {
      return false;
    }
  }
}
