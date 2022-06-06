import 'dart:typed_data';

import 'package:artlist_dl/bloc/download/download_state.dart';
import 'package:artlist_dl/data/model/song_detail_response.dart';
import 'package:artlist_dl/data/repository/song_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadCubit extends Cubit<DownloadState> {
  final SongRepository songRepository;

  DownloadCubit({required this.songRepository}) : super(const DownloadInitialState());

  static DownloadCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<DownloadCubit>(context, listen: listen);

  final List<int> _bytes = [];
  int _total = 0, _received = 0;

  Future<void> download(SongDetailResponse songInfo) async {
    try {
      var response = await songRepository.getMp3Stream(url: songInfo.mP3FilePath!);
      _total = response.contentLength ?? 0;
      var totalKB = _total ~/ 1024;
      response.stream.listen((value) {
        _bytes.addAll(value);
        _received += value.length;
        var receivedKB = _received ~/ 1024;
        var progressPercent = receivedKB / totalKB * 100;
        emit(DownloadInProgress(percentProgress: progressPercent, id: songInfo.songId!));
      }, onError: (e) {
        emit(DownloadFailed(error: e.toString()));
      }, onDone: () async {
        await songRepository.saveSongToFile(
            fileName: songInfo.songName!, song: Uint8List.fromList(_bytes));
        emit(DownloadSuccess());
      });
    } catch (e) {
      emit(DownloadFailed(error: e.toString()));
    }
  }
}
